#ifndef __TYPE_H__
#define __TYPE_H__
#include <vector>
#include <string>

class Type
{
private:
    int kind;
protected:
    enum {INT, VOID, FUNC, PTR, CONST, ARRAY};
public:
    Type(int kind) : kind(kind) {};
    virtual ~Type() {};
    virtual std::string toStr() = 0;
    virtual bool isI32() = 0;
    bool isInt() const {return kind == INT;};
    bool isVoid() const {return kind == VOID;};
    bool isFunc() const {return kind == FUNC;};
    bool isConst() const {return kind == CONST;};
    bool isArray() const {return kind == ARRAY;};
};

class ConstType : public Type
{
private:
    Type *constType;
public:
    ConstType(Type* constType) : Type(Type::CONST), constType(constType){};
    std::string toStr();
    bool isI32(){return true;}
};

class ArrayType : public Type
{
private:
    Type *arrayType;
    int dimension;
public:
    ArrayType(Type* arrayType) : Type(Type::ARRAY), arrayType(arrayType){dimension=1;};
    ArrayType(Type* arrayType,int dimension) : Type(Type::ARRAY), arrayType(arrayType), dimension(dimension){};
    std::string toStr();
    int getDimen(){return dimension;}
    bool isI32(){return false;}
};

class IntType : public Type
{
private:
    int size;
public:
    IntType(int size) : Type(Type::INT), size(size){};
    std::string toStr();
    bool isI32(){return size==32;}
};

class VoidType : public Type
{
public:
    VoidType() : Type(Type::VOID){};
    std::string toStr();
    bool isI32(){return false;}
};

class FunctionType : public Type
{
private:
    Type *returnType;
    std::vector<Type*> paramsType;
public:
    FunctionType() : Type(Type::FUNC){};
    FunctionType(FunctionType* type) : Type(Type::FUNC), returnType(type->getRetType()),paramsType(type->getParams()){};
    FunctionType(Type* returnType, std::vector<Type*> paramsType) : 
    Type(Type::FUNC), returnType(returnType), paramsType(paramsType){};
    Type* getRetType() {return returnType;};
    void setParamsType(std::vector<Type*> paramsType){paramsType = paramsType;}
    std::vector<Type*> getParams(){return paramsType;}
    std::string toStr();
    bool isI32(){return false;}
};

class PointerType : public Type
{
private:
    Type *valueType;
public:
    PointerType(Type* valueType) : Type(Type::PTR) {this->valueType = valueType;};
    std::string toStr();
    bool isI32(){return false;}
};

class TypeSystem
{
private:
    static IntType commonInt;
    static IntType commonBool;
    static VoidType commonVoid;
    static ArrayType commonArray;
    static ConstType commonConst;
public:
    static Type *intType;
    static Type *voidType;
    static Type *boolType;
    static Type *arrayType;
    static Type *constType;
};

#endif
