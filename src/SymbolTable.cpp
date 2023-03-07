#include "SymbolTable.h"
#include <iostream>
#include <sstream>
#include "Type.h"

SymbolEntry::SymbolEntry(Type *type, int kind) 
{
    this->type = type;
    this->kind = kind;
}

ConstantSymbolEntry::ConstantSymbolEntry(Type *type, int value) : SymbolEntry(type, SymbolEntry::CONSTANT)
{
    this->value = value;
}

std::string ConstantSymbolEntry::toStr()
{
    std::ostringstream buffer;
    buffer << value;
    return buffer.str();
}

IdentifierSymbolEntry::IdentifierSymbolEntry(Type *type, std::string name, int scope) : SymbolEntry(type, SymbolEntry::VARIABLE), name(name)
{
    this->scope = scope;
    addr = nullptr;
}

IdentifierSymbolEntry::IdentifierSymbolEntry(Type *type, int scope) : SymbolEntry(type, SymbolEntry::VARIABLE)
{
    this->scope = scope;
    addr = nullptr;
}

IdentifierSymbolEntry::IdentifierSymbolEntry(std::string name, IdentifierSymbolEntry* temp) : SymbolEntry(temp->getType(), SymbolEntry::VARIABLE), name(name)
{
    this->scope = temp->getScope();
    addr = nullptr;
}

std::string IdentifierSymbolEntry::toStr()
{
    if(scope==GLOBAL){
        return "@" + name;
    }else{
        return "%" + name;
    }
    
}

TemporarySymbolEntry::TemporarySymbolEntry(Type *type, int label) : SymbolEntry(type, SymbolEntry::TEMPORARY)
{
    this->label = label;
}

std::string TemporarySymbolEntry::toStr()
{
    std::ostringstream buffer;
    buffer << "%t" << label;
    return buffer.str();
}

SymbolTable::SymbolTable()
{
    FunctionType* ft;
    SymbolEntry* se;
    std::vector<Type*> paramstype;

    ft = new FunctionType(TypeSystem::intType,paramstype);
    se = new IdentifierSymbolEntry(ft,std::string("getint"),0);
    identifiers->install("getint",se);

    ft = new FunctionType(TypeSystem::intType,paramstype);
    se = new IdentifierSymbolEntry(ft,std::string("getch"),0);
    identifiers->install("getch",se);

    paramstype.push_back(TypeSystem::constType);
    ft = new FunctionType(TypeSystem::intType,paramstype);
    se = new IdentifierSymbolEntry(ft,std::string("getarray"),0);
    identifiers->install("getarray",se);
    paramstype.pop_back();

    paramstype.push_back(TypeSystem::intType);
    paramstype.push_back(TypeSystem::arrayType);
    ft = new FunctionType(TypeSystem::voidType,paramstype);
    se = new IdentifierSymbolEntry(ft,std::string("putarray"),0);
    identifiers->install("putarray",se);
    paramstype.pop_back();
    paramstype.pop_back();

    paramstype.push_back(TypeSystem::intType);
    ft = new FunctionType(TypeSystem::voidType,paramstype);
    se = new IdentifierSymbolEntry(ft,std::string("putint"),0);
    identifiers->install("putint",se);
    paramstype.pop_back();

    paramstype.push_back(TypeSystem::intType);
    ft = new FunctionType(TypeSystem::voidType,paramstype);
    se = new IdentifierSymbolEntry(ft,std::string("putch"),0);
    identifiers->install("putch",se);
    paramstype.pop_back();

    paramstype.push_back(TypeSystem::intType);
    ft = new FunctionType(TypeSystem::voidType,paramstype);
    se = new IdentifierSymbolEntry(ft,std::string("putf"),0);
    identifiers->install("putf",se);
    paramstype.pop_back();
    prev = nullptr;
    level = 0;
}

SymbolTable::SymbolTable(SymbolTable *prev)
{
    this->prev = prev;
    this->level = prev->level + 1;
}

/*
    Description: lookup the symbol entry of an identifier in the symbol table
    Parameters: 
        name: identifier name
    Return: pointer to the symbol entry of the identifier

    hint:
    1. The symbol table is a stack. The top of the stack contains symbol entries in the current scope.
    2. Search the entry in the current symbol table at first.
    3. If it's not in the current table, search it in previous ones(along the 'prev' link).
    4. If you find the entry, return it.
    5. If you can't find it in all symbol tables, return nullptr.
*/
SymbolEntry* SymbolTable::lookup(std::string name)
{
    // Todo
    if(symbolTable[name]!=nullptr){
        return symbolTable[name];
    }
    if(this->prev!=nullptr){
        return this->prev->lookup(name);
    }
    return nullptr; 
}

SymbolEntry* SymbolTable::lookup_ch(std::string name)
{
    if(symbolTable[name]!=nullptr){
        return symbolTable[name];
    }
    return nullptr; 
}


// install the entry into current symbol table.
void SymbolTable::install(std::string name, SymbolEntry* entry)
{
    symbolTable[name] = entry;
}

int SymbolTable::counter = 0;
static SymbolTable t;
SymbolTable *identifiers = &t;
SymbolTable *globals = &t;
IdentifierSymbolEntry *temp;

