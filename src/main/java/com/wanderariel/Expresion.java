package com.wanderariel;

enum TipoExpresion {
    INT,
    FLOAT,
    STRING,
    BOOL,
    CHAR,
    CHAR_ARR,
    INT_ARR,
    OBJECT,
    NULL
}

public class Expresion {
    private Object valor;
    private TipoExpresion tipo;

    public Expresion(Object valor, TipoExpresion tipo) {
        this.valor = valor;
        this.tipo = tipo;
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
