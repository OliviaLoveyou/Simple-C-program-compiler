#ifndef __AST_H__
#define __AST_H__

#include <fstream>
#include "Operand.h"
#include <map>

extern std::vector<Type *> functype;
extern std::vector<bool> inwhile;
extern std::map<std::string,std::vector<std::vector<Type*>>> function; 
extern int funcdeftimes,arraytemp;
extern std::vector<std::string> fname;
extern std::vector<std::string> aname;
extern std::vector<std::vector<Type*>> rparam;
extern bool misreturn;
extern std::map<std::string,int> arraydef;
extern std::vector<Operand*> operands;
extern std::vector<std::vector<Operand*>> Rparamop;
extern bool createbr;
extern std::vector<Operand*> tempOp;

class SymbolEntry;
class Unit;
class Function;
class BasicBlock;
class Instruction;
class IRBuilder;

class Node
{
private:
    static int counter;
    int seq;
protected:
    std::vector<Instruction*> true_list;
    std::vector<Instruction*> false_list;
    static IRBuilder *builder;
    void backPatchTrue(std::vector<Instruction*> &list, BasicBlock*bb);
    void backPatchFalse(std::vector<Instruction*> &list, BasicBlock*bb);
    std::vector<Instruction*> merge(std::vector<Instruction*> &list1, std::vector<Instruction*> &list2);

public:
    Node();
    int getSeq() const {return seq;};
    static void setIRBuilder(IRBuilder*ib) {builder = ib;};
    virtual void output(int level) = 0;
    virtual void typeCheck() = 0;
    virtual void genCode() = 0;
    std::vector<Instruction*>& trueList() {return true_list;}
    std::vector<Instruction*>& falseList() {return false_list;}
};

class ExprNode : public Node
{
protected:
    SymbolEntry *symbolEntry;
    Operand *dst;   // The result of the subtree is stored into dst.
public:
    ExprNode(SymbolEntry *symbolEntry) : symbolEntry(symbolEntry){};
    Operand* getOperand() {return dst;};
    SymbolEntry* getSymPtr() {return symbolEntry;};
};

class Extend : public ExprNode
{
private:
    ExprNode *expr;
public:
    Extend(SymbolEntry *se, ExprNode*expr) : ExprNode(se), expr(expr) {dst = new Operand(se);};
    void output(int level) {};
    void typeCheck() {expr->typeCheck();};
    void genCode();
};

class BinaryExpr : public ExprNode
{
private:
    int op;
    ExprNode *expr1, *expr2;
public:
    enum {ADD, SUB, MUL, DIV, MOD, AND, OR, LESS, MORE, LESSEQU, MOREEQU, NOTEQUAL, EQUAL};
    BinaryExpr(SymbolEntry *se, int op, ExprNode*expr1, ExprNode*expr2) : ExprNode(se), op(op), expr1(expr1), expr2(expr2)
    {};
    void output(int level);
    void typeCheck();
    void genCode();
};

class UnaryExpr : public ExprNode
{
private:
    int op;
    ExprNode *expr;
public:
    enum {ADD, SUB, NOT};
    UnaryExpr(SymbolEntry* se, int op, ExprNode* expr) : ExprNode(se), op(op), expr(expr)
    {
        SymbolEntry *temp = new TemporarySymbolEntry(se->getType(), SymbolTable::getLabel());
        dst = new Operand(temp);
    };
    void output(int level);
    void typeCheck();
    void genCode();
};

class Constant : public ExprNode
{
public:
    Constant(SymbolEntry *se) : ExprNode(se){dst = new Operand(se);};
    void output(int level);
    void typeCheck();
    void genCode();
};

class BracketList : public ExprNode
{
private:
    ExprNode* bracket;
    ExprNode* bracketList;
public:
    BracketList(SymbolEntry* se,ExprNode* bracket,ExprNode* bracketList):ExprNode(se),bracket(bracket),bracketList(bracketList){};
    void output(int level);
    void typeCheck();
    void genCode();
};

class Bracket : public ExprNode
{
private:
    ExprNode* expr;
public:
    Bracket(SymbolEntry* se): ExprNode(se),expr(nullptr){};
    Bracket(SymbolEntry* se,ExprNode* expr):ExprNode(se),expr(expr){};
    void output(int level);
    void typeCheck();
    void genCode();
};

class InitValList : public ExprNode
{
private:
    ExprNode* initVal;
    ExprNode* initValList;
public:
    InitValList(SymbolEntry* se):ExprNode(se),initVal(nullptr),initValList(nullptr){};
    InitValList(SymbolEntry* se, ExprNode* initVal, ExprNode* initValList ) : ExprNode(se), initVal(initVal), initValList(initValList){};
    void output(int level);
    void typeCheck();
    void genCode();
};

class InitVal : public ExprNode
{
private:
    ExprNode* expr;
public:
    InitVal(SymbolEntry* se,ExprNode* expr):ExprNode(se),expr(expr){};
    void output(int level);
    void typeCheck();
    void genCode();
};

class Id : public ExprNode
{
private:
    int tempcall;
    ExprNode* bracketList;
public:
    Id(SymbolEntry *se) : ExprNode(se){bracketList=nullptr;SymbolEntry *temp = new TemporarySymbolEntry(se->getType(), SymbolTable::getLabel()); dst = new Operand(temp);};
    Id(SymbolEntry *se,ExprNode* bracketList) : ExprNode(se),bracketList(bracketList){SymbolEntry *temp = new TemporarySymbolEntry(se->getType(), SymbolTable::getLabel()); dst = new Operand(temp);};
    void output(int level);
    void typeCheck();
    void genCode();
    void settemp(int i){
        tempcall = i;
    }
    int gettemp(){return tempcall;}
};

class StmtNode : public Node
{};

class CompoundStmt : public StmtNode
{
private:
    StmtNode *stmt;
public:
    CompoundStmt(){stmt = nullptr;};
    CompoundStmt(StmtNode *stmt) : stmt(stmt) {};
    void output(int level);
    void typeCheck();
    void genCode();
};

class SeqNode : public StmtNode
{
private:
    StmtNode *stmt1, *stmt2;
public:
    SeqNode(StmtNode *stmt1, StmtNode *stmt2) : stmt1(stmt1), stmt2(stmt2){};
    void output(int level);
    void typeCheck();
    void genCode();
};

class ExprStmt : public StmtNode
{
private:
    ExprNode* expr;
public:
    ExprStmt(ExprNode* expr):expr(expr){};
    void output(int level);
    void typeCheck();
    void genCode();
};

class DefStmt : public StmtNode
{
private:
    Id* id;
public:
    DefStmt(){}
    DefStmt(Id* id) : id(id) {}
    void output(int level);
    void typeCheck();
    void genCode();
};

class DefStmtList : public DefStmt
{
private:
    StmtNode* def1;
    StmtNode* def2;
public:
    DefStmtList(StmtNode* def1, StmtNode* def2) : def1(def1) ,def2(def2){};
    void output(int level);
    void typeCheck();
    void genCode();
};

class DeclStmt : public StmtNode
{
private:
    StmtNode* defList;
public:
    DeclStmt(StmtNode* defList) : defList(defList) {};
    void output(int level);
    void typeCheck();
    void genCode();
};

class DefAssignStmt : public StmtNode
{
private:
    Id* id;
    ExprNode *expr;
public:
    DefAssignStmt(Id* id, ExprNode *expr) : id(id), expr(expr) {};
    void output(int level);
    void typeCheck();
    void genCode();
};

class ArrayDefAssignStmt : public StmtNode
{
private:
    Id* id;
    ExprNode* bracketList;
    ExprNode* initValList;
public:
    ArrayDefAssignStmt(Id* id, ExprNode* bracketList, ExprNode* initValList):id(id),bracketList(bracketList),initValList(initValList){};
    void output(int level);
    void typeCheck();
    void genCode();
};

class ArrayDefStmt : public StmtNode
{
private:
    Id* id;
    ExprNode* bracketList;
public:
    ArrayDefStmt(Id* id, ExprNode *bracketList) : id(id), bracketList(bracketList) {};
    void output(int level);
    void typeCheck();
    void genCode();
};

class IfStmt : public StmtNode
{
private:
    ExprNode *cond;
    StmtNode *thenStmt;
public:
    IfStmt(ExprNode *cond, StmtNode *thenStmt) : cond(cond), thenStmt(thenStmt){};
    void output(int level);
    void typeCheck();
    void genCode();
};

class IfElseStmt : public StmtNode
{
private:
    ExprNode *cond;
    StmtNode *thenStmt;
    StmtNode *elseStmt;
public:
    IfElseStmt(ExprNode *cond, StmtNode *thenStmt, StmtNode *elseStmt) : cond(cond), thenStmt(thenStmt), elseStmt(elseStmt) {};
    void output(int level);
    void typeCheck();
    void genCode();
};

class WhileStmt : public StmtNode
{
private:
    ExprNode *cond;
    StmtNode *whileStmt;
public:
    WhileStmt(ExprNode *cond, StmtNode *whileStmt) : cond(cond), whileStmt(whileStmt){};
    void output(int level);
    void typeCheck();
    void genCode();
};

class ReturnStmt_noExp : public StmtNode
{
private:
public:
    ReturnStmt_noExp() {};
    void output(int level);
    void typeCheck();
    void genCode();
};

class ReturnStmt : public StmtNode
{
private:
    ExprNode *retValue;
public:
    ReturnStmt(ExprNode*retValue) : retValue(retValue) {};
    void output(int level);
    void typeCheck();
    void genCode();
};

class ContinueStmt : public StmtNode
{
public:
    ContinueStmt() {}
    void output(int level);
    void typeCheck();
    void genCode();
};

class BreakStmt : public StmtNode
{
public:
    BreakStmt() {}
    void output(int level);
    void typeCheck();
    void genCode();
};

class EmptyStmt : public StmtNode
{
public:
    EmptyStmt() {}
    void output(int level);
    void typeCheck();
    void genCode();
};

class AssignStmt : public StmtNode
{
private:
    ExprNode *lval;
    ExprNode *expr;
public:
    AssignStmt(ExprNode *lval, ExprNode *expr) : lval(lval), expr(expr) {};
    void output(int level);
    void typeCheck();
    void genCode();
};

class FuncRParam : public StmtNode
{
private:
    ExprNode* expr;
public:
    FuncRParam(){}
    FuncRParam(ExprNode* expr): expr(expr) {}
    void output(int level);
    void typeCheck();
    void genCode();
};

class FuncRParams : public FuncRParam
{
private:
    StmtNode* funcRParam;
    StmtNode* funcRParams;
public:
    FuncRParams(StmtNode* expr, StmtNode* funcRParams) : funcRParam(expr), funcRParams(funcRParams){};
    void output(int level);
    void typeCheck();
    void genCode();
};

class FuncCallExpr : public ExprNode
{
private:
    Id* id;
    StmtNode* funcRParams;
    FunctionType* ret;
    std::vector<Operand* > myoperands;
public:
    FuncCallExpr(SymbolEntry* se, Id* id):ExprNode(se), id(id) 
    { 
        funcRParams=nullptr;
    };
    FuncCallExpr(SymbolEntry* se, Id* id,StmtNode* funcRParams) : ExprNode(se), id(id),funcRParams(funcRParams)
    {
        
    };
    void output(int level);
    void typeCheck();
    void genCode();
    void setret(FunctionType* rett){ret=rett;}
    FunctionType* getret(){return ret;}
    void setOperand(std::vector<Operand*> ops){myoperands=ops;}
    std::vector<Operand*> getOperand(){return myoperands;}
};

class FunctionDef : public StmtNode
{
private:
    SymbolEntry *se;
    StmtNode* param;
    StmtNode *stmt;
    std::vector<Operand* > myoperands;
public:
    FunctionDef(SymbolEntry *se, StmtNode *stmt) : se(se), stmt(stmt){param = nullptr;};
    FunctionDef(SymbolEntry *se, StmtNode* param ,StmtNode *stmt) : se(se), param(param) ,stmt(stmt){};
    void output(int level);
    void typeCheck();
    void genCode();
    void setOperand(std::vector<Operand*> ops){myoperands=ops;}
    std::vector<Operand*> getOperand(){return myoperands;}
};

class FuncFParam : public StmtNode
{
private:
    Id* id;
public:
    FuncFParam(){};
    FuncFParam(Id *id) : id(id) {};
    void output(int level);
    void typeCheck();
    void genCode();
};

class FuncFParams : public FuncFParam
{
private:
    StmtNode* funcFParams;
    StmtNode* funcFParam;
public:
    FuncFParams(StmtNode* funcFParams,StmtNode* funcFParam):funcFParams(funcFParams),funcFParam(funcFParam){};
    void output(int level);
    void typeCheck();
    void genCode();
};

class Ast
{
private:
    Node* root;
public:
    Ast() {root = nullptr;}
    void setRoot(Node*n) {root = n;}
    void output();
    void typeCheck();
    void genCode(Unit *unit);
};

#endif
