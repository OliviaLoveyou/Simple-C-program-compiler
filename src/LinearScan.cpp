#include <algorithm>
#include "LinearScan.h"
#include "MachineCode.h"
#include <iostream>
#include "LiveVariableAnalysis.h"

LinearScan::LinearScan(MachineUnit *unit)
{
    this->unit = unit;
    for (int i = 4; i < 11; i++)
        regs.push_back(i);
}

void LinearScan::allocateRegisters()
{
    for (auto &f : unit->getFuncs())
    {
        func = f;
        bool success;
        success = false;
        while (!success)        // repeat until all vregs can be mapped
        {
            computeLiveIntervals();
            success = linearScanRegisterAllocation();
            if (success)        // all vregs can be mapped to real regs
                modifyCode();
            else                // spill vregs that can't be mapped to real regs
                genSpillCode();
        }
    }
}

void LinearScan::makeDuChains()
{
    LiveVariableAnalysis lva;
    lva.pass(func);
    du_chains.clear();
    int i = 0;
    std::map<MachineOperand, std::set<MachineOperand *>> liveVar;
    for (auto &bb : func->getBlocks())
    {
        liveVar.clear();
        for (auto &t : bb->getLiveOut())
            liveVar[*t].insert(t);
        int no;
        no = i = bb->getInsts().size() + i;
        for (auto inst = bb->getInsts().rbegin(); inst != bb->getInsts().rend(); inst++)
        {
            (*inst)->setNo(no--);
            for (auto &def : (*inst)->getDef())
            {
                if (def->isVReg())
                {
                    auto &uses = liveVar[*def];
                    du_chains[def].insert(uses.begin(), uses.end());
                    auto &kill = lva.getAllUses()[*def];
                    std::set<MachineOperand *> res;
                    set_difference(uses.begin(), uses.end(), kill.begin(), kill.end(), inserter(res, res.end()));
                    liveVar[*def] = res;
                }
            }
            for (auto &use : (*inst)->getUse())
            {
                if (use->isVReg())
                    liveVar[*use].insert(use);
            }
        }
    }
}

void LinearScan::computeLiveIntervals()
{
    makeDuChains();
    intervals.clear();
    for (auto &du_chain : du_chains)
    {
        int t = -1;
        for (auto &use : du_chain.second)
            t = std::max(t, use->getParent()->getNo());
        Interval *interval = new Interval({du_chain.first->getParent()->getNo(), t, false, 0, 0, {du_chain.first}, du_chain.second});
        intervals.push_back(interval);
    }
    bool change;
    change = true;
    while (change)
    {
        change = false;
        std::vector<Interval *> t(intervals.begin(), intervals.end());
        for (size_t i = 0; i < t.size(); i++)
            for (size_t j = i + 1; j < t.size(); j++)
            {
                Interval *w1 = t[i];
                Interval *w2 = t[j];
                if (**w1->defs.begin() == **w2->defs.begin())
                {
                    std::set<MachineOperand *> temp;
                    set_intersection(w1->uses.begin(), w1->uses.end(), w2->uses.begin(), w2->uses.end(), inserter(temp, temp.end()));
                    if (!temp.empty())
                    {
                        change = true;
                        w1->defs.insert(w2->defs.begin(), w2->defs.end());
                        w1->uses.insert(w2->uses.begin(), w2->uses.end());
                        w1->start = std::min(w1->start, w2->start);
                        w1->end = std::max(w1->end, w2->end);
                        auto it = std::find(intervals.begin(), intervals.end(), w2);
                        if (it != intervals.end())
                            intervals.erase(it);
                    }
                }
            }
    }
    sort(intervals.begin(), intervals.end(), compareStart);
}

bool LinearScan::linearScanRegisterAllocation()
{
    // Todo
    bool success = true;
    active.clear();
    regs.clear();
    for (int i = 4; i < 11; i++)
    {
        regs.push_back(i);
    }
    for (auto& i : intervals) 
    {
        //Traverse the active list to see if there is an interval whose end time is earlier than the unhandled interval in the list.
        //If so, it needs to be deleted from the active list
        expireOldIntervals(i);
        if (regs.empty())
        {
            //all physical registers are occupied, perform register overflow operation
            spillAtInterval(i);
            success = false;
        } 
        else 
        {
            i->rreg = regs.front();
            regs.erase(regs.begin());
            active.push_back(i);
            sort(active.begin(), active.end(), compareEnd);
        }
    }
    return success;
}

void LinearScan::modifyCode()
{
    for (auto &interval : intervals)
    {
        func->addSavedRegs(interval->rreg);
        for (auto def : interval->defs)
        {
            def->setReg(interval->rreg);
        }
        for (auto use : interval->uses)
        {
            use->setReg(interval->rreg);
        }
    }
}

void LinearScan::genSpillCode()
{
    for(auto &interval:intervals)
    {
        if(!interval->spill)
            continue;
        // TODO
        /* HINT:
         * The vreg should be spilled to memory.
         * 1. insert ldr inst before the use of vreg
         * 2. insert str inst after the def of vreg
         */
        interval->disp = -func->AllocSpace(4);
        auto off = new MachineOperand(MachineOperand::IMM, interval->disp);
        auto fp = new MachineOperand(MachineOperand::REG, 11);
        for (auto use : interval->uses) 
        {
            auto temp = new MachineOperand(*use);
            MachineOperand* operand = new MachineOperand(MachineOperand::VREG, SymbolTable::getLabel());
            auto inst1 = new LoadMInstruction(use->getParent()->getParent(), operand, off);
            use->getParent()->insertBefore(inst1);
            auto inst =new LoadMInstruction(use->getParent()->getParent(), temp, fp, new MachineOperand(*operand));
            use->getParent()->insertBefore(inst);
        }
        for (auto def : interval->defs) {
            auto temp = new MachineOperand(*def);
            MachineOperand* operand = nullptr;
            MachineInstruction *loadOffInst = nullptr, *storeInst = nullptr;
            operand = new MachineOperand(MachineOperand::VREG, SymbolTable::getLabel());
            loadOffInst = new LoadMInstruction(def->getParent()->getParent(), operand, off);
            storeInst = new StoreMInstruction(def->getParent()->getParent(), temp, fp, new MachineOperand(*operand));
            def->getParent()->insertAfter(storeInst);
            def->getParent()->insertAfter(loadOffInst);
        }
    }
}

void LinearScan::expireOldIntervals(Interval *interval)
{
    // Todo
    auto it = active.begin();
    while (it != active.end()) 
    {
        if ((*it)->end >= interval->start)
        {
            return;
        }
        regs.push_back((*it)->rreg);
        it = active.erase(find(active.begin(), active.end(), *it));
        sort(regs.begin(), regs.end());
    }
}

void LinearScan::spillAtInterval(Interval *interval)
{
    // Todo
    auto spill = active.back();
    if (spill->end > interval->end) {
        spill->spill = true;
        interval->rreg = spill->rreg;
        active.push_back(interval);
        sort(active.begin(), active.end(), compareEnd);
    } 
    else {
        interval->spill = true;
    }
}

bool LinearScan::compareEnd(Interval *a, Interval *b)
{
    return a->end < b->end;
}

bool LinearScan::compareStart(Interval *a, Interval *b)
{
    return a->start < b->start;
}
