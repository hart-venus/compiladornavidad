package com.wanderariel;

enum TipoExpresion {
    INT,
    FLOAT,
    STRING,
    BOOL,
    CHAR,
    CHAR_ARR,
    INT_ARR,
    NULL
}

public class Expresion {
    private Object valor;
    private TipoExpresion tipo;

    public Expresion(Object valor, TipoExpresion tipo) {
        this.valor = valor;
        this.tipo = tipo;
    }

    public static TipoExpresion toArr(TipoExpresion tipo) {
        switch (tipo) {
            case INT:
                return TipoExpresion.INT_ARR;
            case CHAR:
                return TipoExpresion.CHAR_ARR;
            default:
                return TipoExpresion.NULL;
        }
    }

    public static TipoExpresion tipoFromString(String tipo) {
        switch (tipo) {
            case "int":
                return TipoExpresion.INT;
            case "float":
                return TipoExpresion.FLOAT;
            case "string":
                return TipoExpresion.STRING;
            case "bool":
                return TipoExpresion.BOOL;
            case "char":
                return TipoExpresion.CHAR;
            case "char[]":
                return TipoExpresion.CHAR_ARR;
            case "int[]":
                return TipoExpresion.INT_ARR;
            default:
                return TipoExpresion.NULL;
        }
    }

    public Object getValor() {
        return valor;
    }

    public TipoExpresion getTipo() {
        return tipo;
    }

    public void setValor(Object valor) {
        this.valor = valor;
    }

    public void setTipo(TipoExpresion tipo) {
        this.tipo = tipo;
    }

}
