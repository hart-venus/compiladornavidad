package com.wanderariel;

public class FirmaFuncion {
    /* Define la firma de una funcion, es decir, su nombre y los tipos de sus parametros. 
     * Adicionalmente, se define el tipo de retorno de la funcion, y tiene un atributo
     * Indicando si la función logra retornar un valor o no.
    */
    private String nombre;
    private TipoExpresion tipoRetorno;
    private boolean retornaValor;
    private TipoExpresion[] tiposParametros;

    public FirmaFuncion(String nombre, TipoExpresion tipoRetorno, boolean retornaValor, TipoExpresion[] tiposParametros) {
        this.nombre = nombre;
        this.tipoRetorno = tipoRetorno;
        this.retornaValor = retornaValor;
        this.tiposParametros = tiposParametros;
    }

    public String getNombre() {
        return nombre;
    }

    public TipoExpresion getTipoRetorno() {
        return tipoRetorno;
    }

    public boolean isRetornaValor() {
        return retornaValor;
    }

    public TipoExpresion[] getTiposParametros() {
        return tiposParametros;
    }

    public void addTipoParametro(TipoExpresion tipo) {
        TipoExpresion[] newTiposParametros = new TipoExpresion[tiposParametros.length + 1];
        for (int i = 0; i < tiposParametros.length; i++) {
            newTiposParametros[i] = tiposParametros[i];
        }
        newTiposParametros[tiposParametros.length] = tipo;
        tiposParametros = newTiposParametros;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    public void setTipoRetorno(TipoExpresion tipoRetorno) {
        this.tipoRetorno = tipoRetorno;
    }

    public void setRetornaValor(boolean retornaValor) {
        this.retornaValor = retornaValor;
    }

    public void setTiposParametros(TipoExpresion[] tiposParametros) {
        this.tiposParametros = tiposParametros;
    }
}
