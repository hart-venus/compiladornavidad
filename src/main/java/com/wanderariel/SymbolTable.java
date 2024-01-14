package com.wanderariel;

import java.util.ArrayList;

public class SymbolTable {
    private ArrayList<SymbolTableObject> symbolTable;
    private int currentSize; // tamaño del stack frame actual

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
