package com.wanderariel;

public class SymbolTableObject {
    private String tipoEntrada; // Tipo de entrada
    private String tipoDato; // Tipo de dato
    private String nombre; // Nombre de la variable
    private String direccion; // Direccion de la variable (opcional)

    public String getNombre() {
        return nombre; 
    }
    public String getTipoDato() {
        return tipoDato;
    }

    public TipoExpresion getTipoExpresion(){
        return Expresion.tipoFromString(tipoDato);
    }

    public String getTipoEntrada() {
        return tipoEntrada;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion; 
    }

    /** Constructor de la clase SymbolTableObject
     * @param tipoEntrada Tipo de entrada
     * @param tipoDato Tipo de dato
     * @param nombre Nombre de la variable
     */
    public SymbolTableObject(String tipoEntrada, String tipoDato, String nombre) {
        this.tipoEntrada = tipoEntrada;
        this.tipoDato = tipoDato;
        this.nombre = nombre;
    }
    /** override del metodo toString para imprimir el objeto
     * @return String con el objeto
     */
    public String toString() {
        return String.format("%s\t%s\t%s", tipoEntrada, tipoDato, nombre);
    }
}
