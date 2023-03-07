#include "Unit.h"

extern FILE* yyout;

void Unit::insertFunc(Function *f)
{
    func_list.push_back(f);
}

void Unit::removeFunc(Function *func)
{
    func_list.erase(std::find(func_list.begin(), func_list.end(), func));
}

void Unit::insertGlobal(Instruction *ins)
{
    globalVal.push_back(ins);
}

void Unit::removeGlobal(Instruction *ins)
{
    globalVal.erase(std::find(globalVal.begin(), globalVal.end(), ins));
}

void Unit::output() const
{
    // fprintf(stderr,"unit output\n");
    fprintf(yyout,"declare void @_sysy_starttime(i32)\n");
    fprintf(yyout,"declare void @_sysy_stoptime(i32)\n");
    fprintf(yyout,"declare i32 @getarray(i32*)\n");
    fprintf(yyout,"declare i32 @getch()\n");
    fprintf(yyout,"declare i32 @getint()\n");
    fprintf(yyout,"declare void @putarray(i32, i32*)\n");
    fprintf(yyout,"declare void @putch(i32)\n");
    fprintf(yyout,"declare void @putint(i32)\n");
    for (auto &ins : globalVal){
        // fprintf(stderr,"function output\n");
        ins->output();
    }
    for (auto &func : func_list){
        // fprintf(stderr,"function output\n");
        func->output();
    }
}

void Unit::genMachineCode(MachineUnit* munit) 
{
    AsmBuilder* builder = new AsmBuilder();
    builder->setUnit(munit);
    for(auto &global:globalVal){
        global->genMachineCode(builder);
    }
    for (auto &func : func_list)
        func->genMachineCode(builder);
}

Unit::~Unit()
{
    for(auto &func:func_list)
        delete func;
}


