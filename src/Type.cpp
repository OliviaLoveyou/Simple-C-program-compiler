#include "Type.h"
#include <sstream>

IntType TypeSystem::commonInt = IntType(32);
IntType TypeSystem::commonBool = IntType(1);
VoidType TypeSystem::commonVoid = VoidType();

Type* TypeSystem::intType = &commonInt;
Type* TypeSystem::voidType = &commonVoid;
Type* TypeSystem::boolType = &commonBool;

ArrayType TypeSystem::commonArray = ArrayType(TypeSystem::intType);
ConstType TypeSystem::commonConst = ConstType(TypeSystem::intType);
Type* TypeSystem::arrayType = &commonArray;
Type* TypeSystem::constType = &commonConst;

std::string ArrayType::toStr()
{
    std::ostringstream buffer;
    buffer << "array " << arrayType->toStr();
    for(int i=0;i<dimension;i++){
        buffer<<"[]";
    }
    return buffer.str();
}


std::string IntType::toStr()
{
    std::ostringstream buffer;
    buffer << "i" << size;
    return buffer.str();
}

std::string ConstType::toStr()
{
    std::ostringstream buffer;
    buffer << "const" << constType->toStr();
    return buffer.str();
}

std::string VoidType::toStr()
{
    return "void";
}

std::string FunctionType::toStr()
{
    std::ostringstream buffer;
    buffer << returnType->toStr() << "()";
    return buffer.str();
}

std::string PointerType::toStr()
{
    std::ostringstream buffer;
    buffer << valueType->toStr() << "*";
    return buffer.str();
}
