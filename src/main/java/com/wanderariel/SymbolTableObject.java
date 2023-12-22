package com.wanderariel;

public class SymbolTableObject {
    private String tipoEntrada; // Tipo de entrada
    private String tipoDato; // Tipo de dato
    private String nombre; // Nombre de la variable

    public String getNombre() {
        return nombre; 
    }
    public String getTipoDato() {
        return tipoDato;
    }
    public String getTipoEntrada() {
        return tipoEntrada;
    }

    public SymbolTableObject(String tipoEntrada, String tipoDato, String nombre) {
        this.tipoEntrada = tipoEntrada;
        this.tipoDato = tipoDato;
        this.nombre = nombre;
    }

    public String toString() {
        return String.format("%s\t%s\t%s", tipoEntrada, tipoDato, nombre);
    }
}
