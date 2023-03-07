%code top{
    #include <iostream>
    #include <assert.h>
    #include "parser.h"
    extern Ast ast;
    int yylex();
    int yyerror( char const * );
}

%code requires {
    #include "Ast.h"
    #include "SymbolTable.h"
    #include "Type.h"
}

%union {
    int itype;
    char* strtype;
    StmtNode* stmttype;
    ExprNode* exprtype;
    Type* type;
}

%start Program
%token <strtype> ID 
%token <itype> INTEGER
%token IF ELSE
%token WHILE
%token BREAK CONTINUE
%token INT VOID CONST
%token LPAREN RPAREN LBRACE RBRACE LSQUARE RSQUARE SEMICOLON COMMA
%token ADD SUB OR AND LESS MORE ASSIGN MUL DIV MOD NOT 
%token RETURN


%nterm <stmttype> Stmts Stmt WhileStmt ExprStmt AssignStmt BlockStmt IfStmt ReturnStmt EmptyStmt
%nterm <exprtype> Exp UnaryExp EqExp AddExp MulExp Cond LOrExp PrimaryExp LVal RelExp LAndExp  
%nterm <type> Type
%nterm <stmttype> ContinueStmt BreakStmt FuncDef DeclStmt DefStmt DefStmtList FuncFParams FuncFParam FuncRParams FuncRParam
%nterm <exprtype>  FuncCallExpr BracketList Bracket InitVal InitValList



%precedence THEN
%precedence ELSE
%%
Program
    : Stmts {
        ast.setRoot($1);
    }
    ;
Stmts
    : Stmt {$$=$1;}
    | Stmts Stmt{
        $$ = new SeqNode($1, $2);
    }
    ;
Stmt
    : AssignStmt {$$=$1;}
    | BlockStmt {$$=$1;}
    | IfStmt {$$=$1;}
    | WhileStmt {$$=$1;}
    | ReturnStmt {$$=$1;}
    | ContinueStmt {$$=$1;}
    | BreakStmt {$$=$1;}
    | DeclStmt {$$=$1;}
    | FuncDef {$$=$1;}
    | ExprStmt {$$=$1;}
    | EmptyStmt {$$ =$1;}
    ;
AssignStmt
    :
    LVal ASSIGN Exp SEMICOLON {
        $$ = new AssignStmt($1, $3);
    }
    ;
ExprStmt
    :
    Exp SEMICOLON {
        $$ = new ExprStmt($1);
    }
    ;
BlockStmt
    :   
    LBRACE 
    {identifiers = new SymbolTable(identifiers);} 
    Stmts RBRACE 
    {
        $$ = new CompoundStmt($3);
        SymbolTable *top = identifiers;
        identifiers = identifiers->getPrev();
        delete top;
    }
    |
    LBRACE RBRACE {
        $$ = new CompoundStmt();
    }
    ;
IfStmt
    : IF LPAREN Cond RPAREN Stmt %prec THEN {
        $$ = new IfStmt($3, $5);
    }
    | IF LPAREN Cond RPAREN Stmt ELSE Stmt {
        $$ = new IfElseStmt($3, $5, $7);
    }
    ;
WhileStmt
    : WHILE LPAREN Cond RPAREN Stmt {
        $$ = new WhileStmt($3, $5);
    }
    ;
ReturnStmt
    :
    RETURN Exp SEMICOLON {
        $$ = new ReturnStmt($2);
    }
    | RETURN SEMICOLON {
        $$ = new ReturnStmt_noExp();
    }
    ;
ContinueStmt
    :
    CONTINUE SEMICOLON {
        $$ = new ContinueStmt();
    }
    ;
BreakStmt
    :
    BREAK SEMICOLON {
        $$ = new BreakStmt();
    }
    ;
EmptyStmt
    :
    SEMICOLON {
        $$ = new EmptyStmt();
    }

Exp
    :
    AddExp {$$ = $1;}
    ;
Cond
    :
    LOrExp {$$ = $1;}
    ;
LVal
    : ID {
        SymbolEntry *se;
        se = identifiers->lookup($1);
        if(se == nullptr)
        {
            fprintf(stderr, "identifier \"%s\" is undefined\n", (char*)$1);
            delete [](char*)$1;
            exit(EXIT_SUCCESS);
        }
        $$ = new Id(se);
        delete []$1;
    }
    |
    ID BracketList {
        SymbolEntry* se;
        se = identifiers->lookup($1);
        if(se == nullptr)
        {
            fprintf(stderr, "identifier \"%s\" is undefined\n", (char*)$1);
            delete [](char*)$1;
            exit(EXIT_SUCCESS);
        }
        $$ = new Id(se,$2);
    }
    ;
PrimaryExp
    :
    LVal {
        $$ = $1;
    }
    | INTEGER {
        SymbolEntry *se = new ConstantSymbolEntry(TypeSystem::intType, $1);
        $$ = new Constant(se);
    }
    | LPAREN Exp RPAREN {$$ = $2;}
    ;

UnaryExp
    : PrimaryExp {$$ =$1;}
    | FuncCallExpr {$$ = $1;}
    | ADD UnaryExp 
    {
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        $$ = new UnaryExpr(se, UnaryExpr::ADD, $2);
    }
    | SUB UnaryExp
    {
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        $$ = new UnaryExpr(se, UnaryExpr::SUB, $2);
    }
    | NOT UnaryExp
    {
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
        $$ = new UnaryExpr(se, UnaryExpr::NOT, $2);
    }
    ;
MulExp
    :
    UnaryExp {$$ = $1;}
    |
    MulExp MUL UnaryExp
    {
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::MUL, $1, $3);
    }
    |
    MulExp DIV UnaryExp
    {
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::DIV, $1, $3);
    }
    |
    MulExp MOD UnaryExp
    {
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::MOD, $1, $3);
    }
    ;
AddExp
    :
    MulExp {$$ = $1;}
    |
    AddExp ADD MulExp
    {
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::ADD, $1, $3);
    }
    |
    AddExp SUB MulExp
    {
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::SUB, $1, $3);
    }
    ;
RelExp
    :
    AddExp {$$ = $1;}
    |
    RelExp LESS AddExp
    {
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::LESS, $1, $3);
    }
    |
    RelExp MORE AddExp
    {
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::MORE, $1, $3);
    }
    |
    RelExp LESS ASSIGN AddExp
    {
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::LESSEQU, $1, $4);
    }
    |
    RelExp MORE ASSIGN AddExp
    {
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::MOREEQU, $1, $4);
    }
    ;
EqExp
    :
    RelExp {$$ = $1;}
    | EqExp ASSIGN ASSIGN RelExp
    {
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::EQUAL, $1, $4);
    }
    | EqExp NOT ASSIGN RelExp
    {
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::NOTEQUAL, $1, $4);
    }
    ;
LAndExp
    :
    EqExp {$$ = $1;}
    |
    LAndExp AND EqExp
    {
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::AND, $1, $3);
    }
    ;
LOrExp
    :
    LAndExp {$$ = $1;}
    |
    LOrExp OR LAndExp
    {
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::OR, $1, $3);
    }
    ;
Type
    : INT {
        $$ = TypeSystem::intType;
    }
    | VOID {
        $$ = TypeSystem::voidType;
    }
    ;
DeclStmt
    :
    Type DefStmtList SEMICOLON {
        // temp = new IdentifierSymbolEntry($1,identifiers->getLevel());
        // SymbolEntry *se;
        // se = new IdentifierSymbolEntry($1, $2, identifiers->getLevel());
        // identifiers->install($2, se);
        $$ = new DeclStmt($2);
        // delete []$2;
    }
    |
    CONST Type DefStmtList SEMICOLON {
        // temp = new IdentifierSymbolEntry($2,identifiers->getLevel());
        $$ = new DeclStmt($3);
    }
    ;
DefStmtList
    :
    DefStmt COMMA DefStmtList {
        $$ = new DefStmtList($1, $3);
    }
    |
    DefStmt {
        $$ = $1;
    }
    ;
BracketList
    :
    Bracket BracketList {
        SymbolEntry* se;
        se = new TemporarySymbolEntry(TypeSystem::intType,SymbolTable::getLabel());
        $$ = new BracketList(se,$1,$2);
    }
    | Bracket {
        $$=$1;
    }
    ;
Bracket
    :
    LSQUARE RSQUARE {
        SymbolEntry* se;
        se = new TemporarySymbolEntry(TypeSystem::intType,SymbolTable::getLabel());
        $$ = new Bracket(se);
    }
    | LSQUARE Exp RSQUARE {
        SymbolEntry* se;
        se = new TemporarySymbolEntry(TypeSystem::intType,SymbolTable::getLabel());
        $$ = new Bracket(se,$2);
    }
    ;
DefStmt
    :
    ID {
        SymbolEntry *se;
        se=identifiers->lookup_ch($1);
        // assert(se!=nullptr);
        if(se != nullptr)
        {
            fprintf(stderr, "identifier \"%s\" is redefined\n", (char*)$1);
            delete [](char*)$1;
            exit(EXIT_SUCCESS);
        }
        // se = new IdentifierSymbolEntry($1, temp);
        se = new IdentifierSymbolEntry(TypeSystem::intType, $1, identifiers->getLevel());
        identifiers->install($1, se);
        $$ = new DefStmt(new Id(se));
    }
    |
    ID ASSIGN Exp {
        SymbolEntry *se;
        se=identifiers->lookup_ch($1);
        // assert(se!=nullptr);
        if(se != nullptr)
        {
            fprintf(stderr, "identifier \"%s\" is redefined\n", (char*)$1);
            delete [](char*)$1;
            exit(EXIT_SUCCESS);
        }
        // se = new IdentifierSymbolEntry($1, temp);
        se = new IdentifierSymbolEntry(TypeSystem::intType, $1, identifiers->getLevel());
        identifiers->install($1, se);
        $$ = new DefAssignStmt(new Id(se) ,$3);
    }
    | ID BracketList {
        SymbolEntry* se;
        se = new IdentifierSymbolEntry(TypeSystem::arrayType, $1, identifiers->getLevel());
        identifiers->install($1, se);
        $$ = new ArrayDefStmt(new Id(se), $2);
    }
    | ID BracketList ASSIGN LBRACE InitValList RBRACE {
        SymbolEntry* se;
        se = new IdentifierSymbolEntry(TypeSystem::arrayType, $1, identifiers->getLevel());
        identifiers->install($1, se);
        $$ = new ArrayDefAssignStmt(new Id(se),$2, $5);
    }
    ;
InitValList
    :
    InitVal COMMA InitValList {
        SymbolEntry* se;
        se = new TemporarySymbolEntry(TypeSystem::intType,SymbolTable::getLabel());
        $$ = new InitValList(se,$1,$3);
    }
    | InitVal {
        $$ =$1;
    }
    | %empty {
        SymbolEntry* se;
        se = new TemporarySymbolEntry(TypeSystem::intType,SymbolTable::getLabel());
        $$ = new InitValList(se);
     }
    ; 
InitVal
    :
    LBRACE InitValList RBRACE {
        SymbolEntry* se;
        se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        $$ = new InitVal(se, $2);
    }
    | Exp {$$=$1;}
    ;
FuncCallExpr
    :
    ID LPAREN FuncRParams RPAREN {
        Type *funcType;
        funcType = new FunctionType(TypeSystem::voidType,{});
        SymbolEntry *se = new IdentifierSymbolEntry(funcType, $1, 0);
        // se=identifiers->lookup($1);
        // assert(se!=nullptr);
        // if(se == nullptr)
        // {
        //     fprintf(stderr, "identifier \"%s\" is undefined\n", (char*)$1);
        //     delete [](char*)$1;
        //     exit(EXIT_SUCCESS);
        // }
        $$ = new FuncCallExpr(se,new Id(se),$3);
    }
    | ID LPAREN RPAREN {
        Type *funcType;
        funcType = new FunctionType(TypeSystem::voidType,{});
        SymbolEntry *se = new IdentifierSymbolEntry(funcType, $1, 0);
        // se=identifiers->lookup($1);
        // //assert(se!=nullptr);
        // if(se == nullptr)
        // {
        //     fprintf(stderr, "identifier \"%s\" is undefined\n", (char*)$1);
        //     delete [](char*)$1;
        //     exit(EXIT_SUCCESS);
        // }
        $$ = new FuncCallExpr(se,new Id(se));
    }
    ;
FuncRParams
    : FuncRParam COMMA FuncRParams {
        // SymbolEntry* se;
        // se = new TemporarySymbolEntry(TypeSystem::intType,SymbolTable::getLabel());
        $$ = new FuncRParams($1, $3);
        }
    | FuncRParam {
        // SymbolEntry* se;
        // se = new TemporarySymbolEntry(TypeSystem::intType,SymbolTable::getLabel());
        $$ = $1;
        // $$=$1;
    }
    ;
FuncRParam
    :
    Exp {
        $$ = new FuncRParam($1);
    }
    ;
FuncFParams
    : 
    FuncFParams COMMA FuncFParam {
        $$ = new FuncFParams($1,$3);
    }
    |
    FuncFParam {
        $$ = $1;
    }
    ;
FuncFParam
    :
    Type ID {
        SymbolEntry *se;
        // se = new IdentifierSymbolEntry($1, temp);
        se = new IdentifierSymbolEntry($1, $2, identifiers->getLevel());
        identifiers->install($2, se);
        $$ = new FuncFParam(new Id(se));
    }
    |
    Type ID BracketList {
        SymbolEntry *se;
        se = new IdentifierSymbolEntry(TypeSystem::arrayType, $2, identifiers->getLevel());
        identifiers->install($2, se);
        $$ = new FuncFParam(new Id(se,$3));
    }
    ;
FuncDef
    :
     Type ID LPAREN  {
        Type *funcType;
        funcType = new FunctionType($1,{});
        SymbolEntry *se = new IdentifierSymbolEntry(funcType, $2, identifiers->getLevel());
        identifiers->install($2, se);
        identifiers = new SymbolTable(identifiers);
    }
     FuncFParams RPAREN
    BlockStmt
    {
        SymbolEntry *se1;
        se1 = identifiers->lookup($2);
        assert(se1 != nullptr);
        $$ = new FunctionDef(se1,$5,$7);
        SymbolTable *top = identifiers;
        identifiers = identifiers->getPrev();
        delete top;
        delete []$2;
    }
    |
    Type ID LPAREN {
        Type *funcType;
        funcType = new FunctionType($1,{});
        SymbolEntry *se = new IdentifierSymbolEntry(funcType, $2, identifiers->getLevel());
        identifiers->install($2, se);
        identifiers = new SymbolTable(identifiers);
    }
     RPAREN
    BlockStmt
    {
        SymbolEntry *se1;
        se1 = identifiers->lookup($2);
        assert(se1 != nullptr);
        $$ = new FunctionDef(se1, $6);
        SymbolTable *top = identifiers;
        identifiers = identifiers->getPrev();
        delete top;
        delete []$2;
    }
    ;
%%

int yyerror(char const* message)
{
    std::cerr<<message<<std::endl;
    return -1;
}
