package com.wanderariel;

import java.util.ArrayList;

public class SymbolTable {
    private ArrayList<SymbolTableObject> symbolTable;
    private int currentSize; // tamaño del stack frame actual
    private ArrayList<String> controlStack = new ArrayList<String>();

    public SymbolTable() {
        this.symbolTable = new ArrayList<SymbolTableObject>();
        this.currentSize = 0;
    }

    public ArrayList<SymbolTableObject> getSymbolTable() {
        return symbolTable;
    }

    public void setSymbolTable(ArrayList<SymbolTableObject> symbolTable) {
        this.symbolTable = symbolTable;
    }

    public int getCurrentSize() {
        return currentSize;
    }

    public String controlStackTop() {
        if (controlStack.size() > 0) {
            return controlStack.get(controlStack.size() - 1);
        }
        return null;
    }

    public String controlStackPop() {
        if (controlStack.size() > 0) {
            return controlStack.remove(controlStack.size() - 1);
        }
        return null;
    }

    public void controlStackPush(String value) {
        controlStack.add(value);
    }

    public void increaseSize(int size) {
        this.currentSize += size;
    }

    public void imprimirTablaSimbolos() {
        for (SymbolTableObject value : symbolTable) {
            System.out.println(value.toString());
        }
        System.out.println();
    }
    

}
