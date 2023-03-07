#include "Instruction.h"
#include "BasicBlock.h"
#include <iostream>
#include "Function.h"
#include "Type.h"
extern FILE* yyout;
int paramNum=0;

Instruction::Instruction(unsigned instType, BasicBlock *insert_bb)
{
    prev = next = this;
    opcode = -1;
    this->instType = instType;
    if (insert_bb != nullptr)
    {
        insert_bb->insertBack(this);
        parent = insert_bb;
    }
}

Instruction::~Instruction()
{
    parent->remove(this);
}

BasicBlock *Instruction::getParent()
{
    return parent;
}

void Instruction::setParent(BasicBlock *bb)
{
    parent = bb;
}

void Instruction::setNext(Instruction *inst)
{
    next = inst;
}

void Instruction::setPrev(Instruction *inst)
{
    prev = inst;
}

Instruction *Instruction::getNext()
{
    return next;
}

Instruction *Instruction::getPrev()
{
    return prev;
}

BinaryInstruction::BinaryInstruction(unsigned opcode, Operand *dst, Operand *src1, Operand *src2, BasicBlock *insert_bb) : Instruction(BINARY, insert_bb)
{
    this->opcode = opcode;
    operands.push_back(dst);
    operands.push_back(src1);
    operands.push_back(src2);
    dst->setDef(this);
    src1->addUse(this);
    src2->addUse(this);
}

BinaryInstruction::~BinaryInstruction()
{
    operands[0]->setDef(nullptr);
    if(operands[0]->usersNum() == 0)
        delete operands[0];
    operands[1]->removeUse(this);
    operands[2]->removeUse(this);
}

void BinaryInstruction::output() const
{
    // fprintf(stderr,"binaryinstruction output\n");
    std::string s1, s2, s3, op, type;
    s1 = operands[0]->toStr();
    s2 = operands[1]->toStr();
    s3 = operands[2]->toStr();
    type = operands[0]->getType()->toStr();
    switch (opcode)
    {
    case ADD:
        op = "add";
        break;
    case SUB:
        op = "sub";
        break;
    case MUL:
        op = "mul";
        break;
    case DIV:
        op = "sdiv";
        break;
    case MOD:
        op = "srem";
        break;
    case AND:
        op = "and";
        break;
    case OR:
        op = "or";
    case XOR:
        op = "xor";
        break;
    default:
        break;
    }
    fprintf(yyout, "  %s = %s %s %s, %s\n", s1.c_str(), op.c_str(), type.c_str(), s2.c_str(), s3.c_str());
}

ExtInstruction::ExtInstruction(Operand* dst, Operand*src, BasicBlock* insert_bb ) : Instruction(EXT, insert_bb)
{
    operands.push_back(dst);
    operands.push_back(src);
    dst->setDef(this);
    src->addUse(this);
}

void ExtInstruction::output() const
{
    std::string dst, src, dst_type, src_type;
    dst = operands[0]->toStr();
    src = operands[1]->toStr();
    dst_type = operands[0]->getType()->toStr();
    src_type = operands[1]->getType()->toStr();
    fprintf(yyout, "  %s = zext %s %s to %s\n", dst.c_str(), src_type.c_str(), src.c_str(), dst_type.c_str());
}

FuncCallInstruction::FuncCallInstruction(Operand *dst, SymbolEntry* se, std::vector<Operand*> params, BasicBlock *insert_bb ) : Instruction(FUNCCALL, insert_bb),params(params)
{
    sym_ptr = se;
    operands.push_back(dst);
    dst->setDef(this);
    for(int i=0;i<(int)params.size();i++)
    {
        params[i]->addUse(this);
    }
}

FuncCallInstruction::~FuncCallInstruction()
{
    operands[0]->setDef(nullptr);
    if(operands[0]->usersNum() == 0)
    {
        delete operands[0];
    }
    for(int i=0;i<(int)params.size();i++)
    {
        params[i]->removeUse(this);
    }
}

void FuncCallInstruction::output() const
{
    
    std::string dst, funcName,paramType,param;
    dst = operands[0]->toStr();
    FunctionType* funcType = dynamic_cast<FunctionType*>(sym_ptr->getType());
    Type *retType = funcType->getRetType();
    if(retType->isVoid()){
        if((int)params.size()>0)
        {
            fprintf(yyout, "  call %s %s(",retType->toStr().c_str(), sym_ptr->toStr().c_str());
            for(int i=0;i<(int)params.size();i++)
            {
                paramType = params[i]->getType()->toStr();
                param = params[i]->toStr();
                fprintf(yyout, "%s %s", paramType.c_str(), param.c_str());
                if(i<(int)params.size()-1)
                {
                    fprintf(yyout ,", ");
                }
            }
            fprintf(yyout, ")\n");
        }
        else{
            fprintf(yyout, "  call %s %s()\n", retType->toStr().c_str(), sym_ptr->toStr().c_str());
        }
    }else{
        if((int)params.size()>0)
        {
            fprintf(yyout, "  %s = call %s %s(", dst.c_str(), retType->toStr().c_str(), sym_ptr->toStr().c_str());
            for(int i=0;i<(int)params.size();i++)
            {
                paramType = params[i]->getType()->toStr();
                param = params[i]->toStr();
                fprintf(yyout, "%s %s", paramType.c_str(), param.c_str());
                if(i<(int)params.size()-1)
                {
                    fprintf(yyout ,", ");
                }
            }
            fprintf(yyout, ")\n");
        }
        else{
            fprintf(stderr,"%s , %s\n",sym_ptr->getName().c_str(),sym_ptr->toStr().c_str());
            fprintf(yyout, " %s = call %s %s()\n", dst.c_str(), retType->toStr().c_str(), sym_ptr->toStr().c_str());
        }
    }
    

}

UnaryInstruction::UnaryInstruction(unsigned opcode, Operand* dst, Operand* src, BasicBlock* insert_bb) : Instruction(UNARY,insert_bb)
{
    this->opcode= opcode;
    operands.push_back(dst);
    operands.push_back(src);
    dst->setDef(this);
    src->addUse(this);
}

UnaryInstruction::~UnaryInstruction()
{
    operands[0]->setDef(nullptr);
    if(operands[0]->usersNum()==0)
        delete operands[0];//
    operands[1]->removeUse(this);
}

void UnaryInstruction::output() const
{
    std::string s1, s2, op, type;
    s1 = operands[0]->toStr();
    s2 = operands[1]->toStr();
    type = operands[0]->getType()->toStr();
    switch(opcode)
    {
    case ADD:
        op = "add";
        break;
    case SUB:
        op = "sub";
        break;
    case NOT:
        op = "not";
        break;
    default:
        break;
    }
    fprintf(yyout, "  %s = %s %s 0, %s\n", s1.c_str(), op.c_str(), type.c_str(), s2.c_str());
}

CmpInstruction::CmpInstruction(unsigned opcode, Operand *dst, Operand *src1, Operand *src2, BasicBlock *insert_bb): Instruction(CMP, insert_bb){
    this->opcode = opcode;
    operands.push_back(dst);
    operands.push_back(src1);
    operands.push_back(src2);
    dst->setDef(this);
    src1->addUse(this);
    src2->addUse(this);
}

CmpInstruction::~CmpInstruction()
{
    operands[0]->setDef(nullptr);
    if(operands[0]->usersNum() == 0)
        delete operands[0];
    operands[1]->removeUse(this);
    operands[2]->removeUse(this);
}

void CmpInstruction::output() const
{
    std::string s1, s2, s3, op, type;
    s1 = operands[0]->toStr();
    s2 = operands[1]->toStr();
    s3 = operands[2]->toStr();
    type = operands[1]->getType()->toStr();
    switch (opcode)
    {
    case E:
        op = "eq";
        break;
    case NE:
        op = "ne";
        break;
    case L:
        op = "slt";
        break;
    case LE:
        op = "sle";
        break;
    case G:
        op = "sgt";
        break;
    case GE:
        op = "sge";
        break;
    default:
        op = "";
        break;
    }

    fprintf(yyout, "  %s = icmp %s %s %s, %s\n", s1.c_str(), op.c_str(), type.c_str(), s2.c_str(), s3.c_str());
}

UncondBrInstruction::UncondBrInstruction(BasicBlock *to, BasicBlock *insert_bb) : Instruction(UNCOND, insert_bb)
{
    branch = to;
}

void UncondBrInstruction::output() const
{
    fprintf(yyout, "  br label %%B%d\n", branch->getNo());
}

void UncondBrInstruction::setBranch(BasicBlock *bb)
{
    branch = bb;
}

BasicBlock *UncondBrInstruction::getBranch()
{
    return branch;
}

CondBrInstruction::CondBrInstruction(BasicBlock*true_branch, BasicBlock*false_branch, Operand *cond, BasicBlock *insert_bb) : Instruction(COND, insert_bb){
    this->true_branch = true_branch;
    this->false_branch = false_branch;
    cond->addUse(this);
    operands.push_back(cond);
}

CondBrInstruction::~CondBrInstruction()
{
    operands[0]->removeUse(this);
}

void CondBrInstruction::output() const
{
    if(true_branch!=nullptr&&false_branch!=nullptr){
        std::string cond, type;
        cond = operands[0]->toStr();
        type = operands[0]->getType()->toStr();
        int true_label = true_branch->getNo();
        int false_label = false_branch->getNo();
        fprintf(yyout, "  br %s %s, label %%B%d, label %%B%d\n", type.c_str(), cond.c_str(), true_label, false_label);
    }
}

void CondBrInstruction::setFalseBranch(BasicBlock *bb)
{
    false_branch = bb;
}

BasicBlock *CondBrInstruction::getFalseBranch()
{
    return false_branch;
}

void CondBrInstruction::setTrueBranch(BasicBlock *bb)
{
    true_branch = bb;
}

BasicBlock *CondBrInstruction::getTrueBranch()
{
    return true_branch;
}

RetInstruction::RetInstruction(Operand *src, BasicBlock *insert_bb) : Instruction(RET, insert_bb)
{
    if(src != nullptr)
    {
        operands.push_back(src);
        src->addUse(this);
    }
}

RetInstruction::~RetInstruction()
{
    if(!operands.empty())
        operands[0]->removeUse(this);
}

void RetInstruction::output() const
{
    if(operands.empty())
    {
        fprintf(yyout, "  ret void\n");
    }
    else
    {
        std::string ret, type;
        ret = operands[0]->toStr();
        type = operands[0]->getType()->toStr();
        fprintf(yyout, "  ret %s %s\n", type.c_str(), ret.c_str());
    }
}

GlobalAllocaInstruction::GlobalAllocaInstruction(Operand *dst, SymbolEntry *se, std::string val,BasicBlock *insert_bb) : Instruction(ALLOCA, insert_bb)
{
    
    operands.push_back(dst);
    dst->setDef(this);
    this->val = val;
    this->se = se;
}

GlobalAllocaInstruction::~GlobalAllocaInstruction()
{
    operands[0]->setDef(nullptr);
    if(operands[0]->usersNum() == 0)
        delete operands[0];
}

void GlobalAllocaInstruction::output() const
{
    // fprintf(stderr,"%s\n",val.c_str());
    std::string dst, type;
    dst = operands[0]->toStr();
    type = se->getType()->toStr();
    fprintf(yyout, "%s = global %s %s, align 4\n", dst.c_str(), type.c_str(),val.c_str());
}

void GlobalAllocaInstruction::genMachineCode(AsmBuilder* builder)
{
    //not completed
    auto unit = builder->getUnit();
    unit->insertGlobal(se);
    unit->insertVal(val);
}

AllocaInstruction::AllocaInstruction(Operand *dst, SymbolEntry *se, BasicBlock *insert_bb) : Instruction(ALLOCA, insert_bb)
{
    operands.push_back(dst);
    dst->setDef(this);
    this->se = se;
}

AllocaInstruction::~AllocaInstruction()
{
    operands[0]->setDef(nullptr);
    if(operands[0]->usersNum() == 0)
        delete operands[0];
}

void AllocaInstruction::output() const
{
    std::string dst, type;
    dst = operands[0]->toStr();
    type = se->getType()->toStr();
    fprintf(yyout, "  %s = alloca %s, align 4\n", dst.c_str(), type.c_str());
}

LoadInstruction::LoadInstruction(Operand *dst, Operand *src_addr, BasicBlock *insert_bb) : Instruction(LOAD, insert_bb)
{
    operands.push_back(dst);
    operands.push_back(src_addr);
    dst->setDef(this);
    src_addr->addUse(this);
}

LoadInstruction::~LoadInstruction()
{
    operands[0]->setDef(nullptr);
    if(operands[0]->usersNum() == 0)
        delete operands[0];
    operands[1]->removeUse(this);
}

void LoadInstruction::output() const
{
    std::string dst = operands[0]->toStr();
    std::string src = operands[1]->toStr();
    std::string src_type;
    std::string dst_type;
    dst_type = operands[0]->getType()->toStr();
    src_type = operands[1]->getType()->toStr();
    fprintf(yyout, "  %s = load %s, %s %s, align 4\n", dst.c_str(), dst_type.c_str(), src_type.c_str(), src.c_str());
}

StoreInstruction::StoreInstruction(Operand *dst_addr, Operand *src, BasicBlock *insert_bb) : Instruction(STORE, insert_bb)
{
    operands.push_back(dst_addr);
    operands.push_back(src);
    dst_addr->addUse(this);
    src->addUse(this);
}

StoreInstruction::~StoreInstruction()
{
    operands[0]->removeUse(this);
    operands[1]->removeUse(this);
}

void StoreInstruction::output() const
{
    std::string dst = operands[0]->toStr();
    std::string src = operands[1]->toStr();
    std::string dst_type = operands[0]->getType()->toStr();
    std::string src_type = operands[1]->getType()->toStr();

    fprintf(yyout, "  store %s %s, %s %s, align 4\n", src_type.c_str(), src.c_str(), dst_type.c_str(), dst.c_str());
}

MachineOperand* Instruction::genMachineOperand(Operand* ope)
{
    auto se = ope->getEntry();
    MachineOperand* mope = nullptr;
    if(se->isConstant())
        mope = new MachineOperand(MachineOperand::IMM, dynamic_cast<ConstantSymbolEntry*>(se)->getValue());
    else if(se->isTemporary())
        mope = new MachineOperand(MachineOperand::VREG, dynamic_cast<TemporarySymbolEntry*>(se)->getLabel());
    else if(se->isVariable())
    {
        auto id_se = dynamic_cast<IdentifierSymbolEntry*>(se);
        if(id_se->isGlobal())
            mope = new MachineOperand(id_se->toStr().c_str());
        else
            //exit(0);
            mope = new MachineOperand(MachineOperand::REG,paramNum++);
    }
    return mope;
}

MachineOperand* Instruction::genMachineReg(int reg) 
{
    return new MachineOperand(MachineOperand::REG, reg);
}

MachineOperand* Instruction::genMachineVReg() 
{
    return new MachineOperand(MachineOperand::VREG, SymbolTable::getLabel());
}

MachineOperand* Instruction::genMachineImm(int val) 
{
    return new MachineOperand(MachineOperand::IMM, val);
}

MachineOperand* Instruction::genMachineLabel(int block_no)
{
    std::ostringstream buf;
    buf << ".L" << block_no;
    std::string label = buf.str();
    return new MachineOperand(label);
}

void AllocaInstruction::genMachineCode(AsmBuilder* builder)
{
    /* HINT:
    * Allocate stack space for local variabel
    * Store frame offset in symbol entry */
    auto cur_func = builder->getFunction();
    int offset = cur_func->AllocSpace(4);
    dynamic_cast<TemporarySymbolEntry*>(operands[0]->getEntry())->setOffset(-offset);
}

void LoadInstruction::genMachineCode(AsmBuilder* builder)
{
    auto cur_block = builder->getBlock();
    MachineInstruction* cur_inst = nullptr;
    // Load global operand
    if(operands[1]->getEntry()->isVariable()
    && dynamic_cast<IdentifierSymbolEntry*>(operands[1]->getEntry())->isGlobal())
    {
        auto dst = genMachineOperand(operands[0]);
        auto internal_reg1 = genMachineVReg();
        auto internal_reg2 = new MachineOperand(*internal_reg1);
        auto src = genMachineOperand(operands[1]);
        // example: load r0, addr_a
        cur_inst = new LoadMInstruction(cur_block, internal_reg1, src);
        cur_block->InsertInst(cur_inst);
        // example: load r1, [r0]
        cur_inst = new LoadMInstruction(cur_block, dst, internal_reg2);
        cur_block->InsertInst(cur_inst);
    }
    // Load local operand
    else if(operands[1]->getEntry()->isTemporary()
    && operands[1]->getDef()
    && operands[1]->getDef()->isAlloc())
    {
        // example: load r1, [r0, #4]
        auto dst = genMachineOperand(operands[0]);
        auto src1 = genMachineReg(11);
        auto src2 = genMachineImm(dynamic_cast<TemporarySymbolEntry*>(operands[1]->getEntry())->getOffset());
        cur_inst = new LoadMInstruction(cur_block, dst, src1, src2);
        cur_block->InsertInst(cur_inst);
    }
    // Load operand from temporary variable
    else
    {
        // example: load r1, [r0]
        auto dst = genMachineOperand(operands[0]);
        auto src = genMachineOperand(operands[1]);
        cur_inst = new LoadMInstruction(cur_block, dst, src);
        cur_block->InsertInst(cur_inst);
    }
}

void StoreInstruction::genMachineCode(AsmBuilder* builder)
{
    // TODO
    auto cur_block = builder->getBlock();
    MachineInstruction* cur_inst = nullptr;
    auto dst = genMachineOperand(operands[0]);
    auto src = genMachineOperand(operands[1]);
    if (operands[1]->getEntry()->isConstant()) {
        auto dst1 = genMachineVReg();
        cur_inst = new LoadMInstruction(cur_block, dst1, src);
        cur_block->InsertInst(cur_inst);
        // src = dst1;
        src = new MachineOperand(*dst1);
    }
    // store global operand
    if(operands[0]->getEntry()->isVariable()
    && dynamic_cast<IdentifierSymbolEntry*>(operands[0]->getEntry())->isGlobal())
    {
        
        auto internal_reg1 = genMachineVReg();
        auto internal_reg2 = new MachineOperand(*internal_reg1);
        
        // example: load r0, addr_a
        cur_inst = new LoadMInstruction(cur_block, internal_reg1, dst);
        cur_block->InsertInst(cur_inst);
        // example: store r1, [r0]
        cur_inst = new StoreMInstruction(cur_block, src, internal_reg2);
        cur_block->InsertInst(cur_inst);
    }
    // Store local operand
    else if(operands[0]->getEntry()->isTemporary()
    && operands[0]->getDef()
    && operands[0]->getDef()->isAlloc())
    {
        // example: store r1, [r0, #4]
        auto dst1 = genMachineReg(11);
        auto dst2 = genMachineImm(dynamic_cast<TemporarySymbolEntry*>(operands[0]->getEntry())->getOffset());
        cur_inst = new StoreMInstruction(cur_block, src, dst1, dst2);
        cur_block->InsertInst(cur_inst);
    }
    // Store operand to temporary variable
    else
    {
        // example: store r1, [r0]
        cur_inst = new StoreMInstruction(cur_block, src, dst);
        cur_block->InsertInst(cur_inst);
    }
}

void BinaryInstruction::genMachineCode(AsmBuilder* builder)
{
    // TODO:
    // complete other instructions
    auto cur_block = builder->getBlock();
    auto dst = genMachineOperand(operands[0]);
    auto src1 = genMachineOperand(operands[1]);
    auto src2 = genMachineOperand(operands[2]);
    /* HINT:
    * The source operands of ADD instruction in ir code both can be immediate num.
    * However, it's not allowed in assembly code.
    * So you need to insert LOAD/MOV instrucrion to load immediate num into register.
    * As to other instructions, such as MUL, CMP, you need to deal with this situation, too.*/
    MachineInstruction* cur_inst = nullptr;
    auto temp_reg = genMachineVReg();
    if(src1->isImm())
    {
        auto internal_reg = genMachineVReg();
        cur_inst = new LoadMInstruction(cur_block, internal_reg, src1);
        cur_block->InsertInst(cur_inst);
        src1 = new MachineOperand(*internal_reg);
    }
    if (src2->isImm()) 
    {
        if ((opcode == BinaryInstruction::OR ||opcode == BinaryInstruction::MUL||opcode == BinaryInstruction::DIV||opcode == BinaryInstruction::MOD)) 
        {
            auto internal_reg = genMachineVReg();
            cur_inst = new LoadMInstruction(cur_block, internal_reg, src2);
            cur_block->InsertInst(cur_inst);
            src2 = new MachineOperand(*internal_reg);
        }
    }
    switch (opcode)
    {
    case ADD:
        cur_inst = new BinaryMInstruction(cur_block, BinaryMInstruction::ADD, dst, src1, src2);
        break;
    case SUB:
        cur_inst = new BinaryMInstruction(cur_block, BinaryMInstruction::SUB, dst, src1, src2);
        break;
    case MUL:
        cur_inst = new BinaryMInstruction(cur_block, BinaryMInstruction::MUL, dst, src1, src2);
        break;
    case DIV:
        cur_inst = new BinaryMInstruction(cur_block, BinaryMInstruction::DIV, dst, src1, src2);
        break;
    case MOD:
        cur_inst = new BinaryMInstruction(cur_block, BinaryMInstruction::DIV, temp_reg, src1, src2);
        cur_block->InsertInst(cur_inst);
        cur_inst = new BinaryMInstruction(cur_block, BinaryMInstruction::MUL, temp_reg, temp_reg, src2);
        cur_block->InsertInst(cur_inst);
        cur_inst = new BinaryMInstruction(cur_block, BinaryMInstruction::SUB, dst, src1, temp_reg);
        break;
    case AND:
        cur_inst = new BinaryMInstruction(cur_block, BinaryMInstruction::AND, dst, src1, src2);
        break;
    case OR:
        cur_inst = new BinaryMInstruction(cur_block, BinaryMInstruction::OR, dst, src1, src2);
        break;
    case XOR:
        cur_inst = new BinaryMInstruction(cur_block, BinaryMInstruction::XOR, dst, src1, src2);
        break;
    default:
        break;
    }
    cur_block->InsertInst(cur_inst);
}

void CmpInstruction::genMachineCode(AsmBuilder* builder)
{
    // TODO
    auto cur_block = builder->getBlock();
    MachineInstruction* cur_inst = nullptr;
    auto dst = genMachineOperand(operands[0]);
    auto src1 = genMachineOperand(operands[1]);
    auto src2 = genMachineOperand(operands[2]);
    if (src1->isImm()) {
        auto internal_reg = genMachineVReg();
        cur_inst = new LoadMInstruction(cur_block, internal_reg, src1);
        cur_block->InsertInst(cur_inst);
        src1 = new MachineOperand(*internal_reg);
    }
    if (src2->isImm()) {
        auto internal_reg = genMachineVReg();
        cur_inst = new LoadMInstruction(cur_block, internal_reg, src2);
        cur_block->InsertInst(cur_inst);
        src2 = new MachineOperand(*internal_reg);
    }
    cur_inst = new CmpMInstruction(cur_block, src1, src2);
    cur_block->InsertInst(cur_inst);
    switch(opcode)
    {
    case CmpInstruction::E:
        builder->BranchCond=MachineInstruction::EQ;
        break;
    case CmpInstruction::NE:
        builder->BranchCond=MachineInstruction::NE;
        break;
    case CmpInstruction::L:
        builder->BranchCond=MachineInstruction::LT;
        break;
    case CmpInstruction::GE:
        builder->BranchCond=MachineInstruction::GE;
        break;
    case CmpInstruction::G:
        builder->BranchCond=MachineInstruction::GT;
        break;
    case CmpInstruction::LE:
        builder->BranchCond=MachineInstruction::LE;
        break;
    default:
        break;
    }
    //mov res, #0
    auto Imm0 = genMachineImm(0);
    cur_inst = new MovMInstruction(cur_block,MovMInstruction::MOV,
    dst,Imm0);
    cur_block->InsertInst(cur_inst);
    //if true, mov res, #1
    auto Imm1 = genMachineImm(1);
    cur_inst = new MovMInstruction(cur_block,MovMInstruction::MOV,
    dst,Imm1,builder->BranchCond);
    cur_block->InsertInst(cur_inst);
}

void UncondBrInstruction::genMachineCode(AsmBuilder* builder)
{
    // TODO
    auto cur_block = builder->getBlock();
    auto dst = genMachineLabel(branch->getNo());
    MachineInstruction* cur_inst = nullptr;
    cur_inst = new BranchMInstruction(cur_block, BranchMInstruction::B, dst);
    cur_block->InsertInst(cur_inst);
}

void CondBrInstruction::genMachineCode(AsmBuilder* builder)
{
    // TODO
    auto cur_block = builder->getBlock();
    auto trueBranch = genMachineLabel(true_branch->getNo());
    auto falseBranch = genMachineLabel(false_branch->getNo());
    MachineInstruction* cur_inst = nullptr;
    cur_inst = new BranchMInstruction(cur_block, BranchMInstruction::B,trueBranch,builder->BranchCond );
    cur_block->InsertInst(cur_inst);
    cur_inst = new BranchMInstruction(cur_block, BranchMInstruction::B, falseBranch);
    cur_block->InsertInst(cur_inst);
}

void UnaryInstruction::genMachineCode(AsmBuilder* builder)
{
    auto cur_block = builder->getBlock();
    auto dst = genMachineOperand(operands[0]);
    auto src = genMachineOperand(operands[1]);
    MachineInstruction* cur_inst = nullptr;
    if(this->opcode==UnaryInstruction::ADD)
    {
        auto zero = genMachineImm(0);
        auto internal_reg = genMachineVReg();
        cur_inst = new LoadMInstruction(cur_block, internal_reg, zero);
        cur_block->InsertInst(cur_inst);
        zero = new MachineOperand(*internal_reg);
        cur_inst = new BinaryMInstruction(cur_block,BinaryMInstruction::ADD,dst,zero,src);
        cur_block->InsertInst(cur_inst);
    }
    if(this->opcode==UnaryInstruction::SUB)
    {
        auto zero = genMachineImm(0);
        auto internal_reg = genMachineVReg();
        cur_inst = new LoadMInstruction(cur_block, internal_reg, zero);
        cur_block->InsertInst(cur_inst);
        zero = new MachineOperand(*internal_reg);
        cur_inst = new BinaryMInstruction(cur_block,BinaryMInstruction::SUB,dst,zero,src);
        cur_block->InsertInst(cur_inst);
    }
}

void ExtInstruction::genMachineCode(AsmBuilder* builder)
{
    auto cur_block = builder->getBlock();
    auto dst = genMachineOperand(operands[0]);
    auto src = genMachineOperand(operands[1]);
    auto cur_inst =new MovMInstruction(cur_block, MovMInstruction::MOV, dst, src);
    cur_block->InsertInst(cur_inst);
}

void FuncCallInstruction::genMachineCode(AsmBuilder* builder)
{
    auto cur_block = builder->getBlock();
    MachineInstruction* cur_inst;
    for(int i=0;i<(int)params.size();i++)
    {
        auto param = genMachineOperand(params[i]);
        if(i<4)
        {
            MachineOperand* reg = genMachineReg(i);
            if (param->isImm()) {
                cur_inst = new LoadMInstruction(cur_block, reg, param);
            } else
                cur_inst = new MovMInstruction(cur_block, MovMInstruction::MOV,
                                            reg, param);
            cur_block->InsertInst(cur_inst);
        }
        else
        {
            MachineOperand* dst = genMachineVReg();
            if (param->isImm()) {
                cur_inst = new LoadMInstruction(cur_block, dst, param);
                cur_block->InsertInst(cur_inst);
                cur_inst = new StackMInstrcuton(cur_block,StackMInstrcuton::PUSH,dst);
                cur_block->InsertInst(cur_inst);
             } else{
                cur_inst = new StackMInstrcuton(cur_block,StackMInstrcuton::PUSH,param);
                cur_block->InsertInst(cur_inst);
             }
        }
    }
    auto label = new MachineOperand(sym_ptr->toStr().c_str());
    cur_inst = new BranchMInstruction(cur_block, BranchMInstruction::BL, label);
    cur_block->InsertInst(cur_inst);
    //clean arg
    if (operands.size() > 4) {
        auto off = genMachineImm((operands.size() - 4) * 4);
        auto sp = new MachineOperand(MachineOperand::REG, 13);
        cur_inst = new BinaryMInstruction(cur_block, BinaryMInstruction::ADD,
                                          sp, sp, off);
        cur_block->InsertInst(cur_inst);
    }
    //store the result
    FunctionType* funcType = dynamic_cast<FunctionType*>(sym_ptr->getType());
    Type *retType = funcType->getRetType();
    if(!retType->isVoid()){
        auto dst = genMachineOperand(operands[0]);
        auto r0 = new MachineOperand(MachineOperand::REG, 0);
        cur_inst =
            new MovMInstruction(cur_block, MovMInstruction::MOV, dst, r0);
        cur_block->InsertInst(cur_inst);
    }
}

void RetInstruction::genMachineCode(AsmBuilder* builder)
{
    // TODO
    /* HINT:
    * 1. Generate mov instruction to save return value in r0
    * 2. Restore callee saved registers and sp, fp
    * 3. Generate bx instruction */
    auto cur_block = builder->getBlock();
    if (!operands.empty()) {
        auto dst = new MachineOperand(MachineOperand::REG, 0);//r0 = ret Value
        auto src = genMachineOperand(operands[0]);
        auto cur_inst =new MovMInstruction(cur_block, MovMInstruction::MOV, dst, src);
        cur_block->InsertInst(cur_inst);
    }
    auto cur_func = builder->getFunction();
    auto sp = new MachineOperand(MachineOperand::REG, 13);//sp
    auto size =new MachineOperand(MachineOperand::IMM, cur_func->AllocSpace(0));
    auto cur_inst = new BinaryMInstruction(cur_block, BinaryMInstruction::ADD, sp, sp, size);
    cur_block->InsertInst(cur_inst);
    /*auto fp = new MachineOperand(MachineOperand::REG, 11);//fp
    auto pop_inst = new StackMInstrcuton(cur_block, StackMInstrcuton::POP, fp);
    cur_block->InsertInst(cur_inst);*/

    auto lr = new MachineOperand(MachineOperand::REG, 14);//return address(link register)
    auto ret_inst = new BranchMInstruction(cur_block, BranchMInstruction::BX, lr);
    cur_block->InsertInst(ret_inst);
    paramNum=0;
}