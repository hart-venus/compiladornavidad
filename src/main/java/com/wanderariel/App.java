package com.wanderariel;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java_cup.runtime.Symbol;

public class App {
  /**
   * Clase principal que agarra el Lexer previamente generado y lo prueba con
   * la entrada del archivo de prueba.
   * Entrada: argumentos de linea de comandos, el primer argumento es el archivo
   * de entrada, el segundo argumento es el archivo de salida.
   * Restricciones: el archivo de entrada debe existir.
   * Objetivo: generar un archivo de salida con la tabla de tokens.
   */
  public static void main(String[] args) {
    // Conseguir primer argumento

    String fileName; 
    if (args.length > 0) {
      fileName = args[0];
    } else {
      // argumento por defecto
      fileName = "src/main/test/merryc.txt";
    }
    // Conseguir segundo argumento
    String markdownOutputPath;
    if (args.length > 1) {
      markdownOutputPath = args[1];
    } else {
      // argumento por defecto
      markdownOutputPath = "src/main/test/merryc.md";
    }

    // Conseguir tercer argumento
    String mipsOutputPath;
    if (args.length > 2) {
      mipsOutputPath = args[2];
    } else {
      // argumento por defecto
      mipsOutputPath = "src/main/test/merryc.asm";
    }

    System.out.println("Leyendo archivo de entrada: " + fileName);

    // Crea una lista de arreglos de strings para la tabla de markdown
    List<String[]> rows = new ArrayList<String[]>();
    // Agrega el encabezado de la tabla como el primer elemento
    rows.add(new String[] {"Lexema", "Token", "Codigo de Token", "Linea", "Columna"});
    // Crea un Lexer con el archivo de entrada, con posible excepcion
    try (BufferedReader reader = new BufferedReader(new FileReader(fileName))) {
      Lexer lexer = new Lexer(reader);
      // Lexer tiene un metodo implementado para conseguir los tokens hecho desde cero
      for (Symbol token : lexer.getTokens()) {
        String[] row = new String[5];
        row[0] = token.value.toString();
        row[1] = sym.terminalNames[token.sym];
        row[2] = Integer.toString(token.sym);
        row[3] = Integer.toString(token.left);
        row[4] = Integer.toString(token.right);
        rows.add(row);
      }
    } catch (IOException e) {
      e.printStackTrace();
    }
    // Crea un MarkdownTablePrinter con la lista de arreglos de strings 
    // y el nombre del archivo de salida, para imprimir la tabla de markdown
    MarkdownTablePrinter printer = new MarkdownTablePrinter(rows, markdownOutputPath);
    printer.print();
    System.out.println("Tabla de tokens generada en: " + markdownOutputPath);

    // Parte 2: Análisis sintáctico
    System.out.println("Analizando sintaxis del archivo de entrada: " + fileName);
    try (BufferedReader reader = new BufferedReader(new FileReader(fileName))) {
      Lexer lexer = new Lexer(reader);
      parser p = new parser(lexer, mipsOutputPath);
      p.parse();
      // Si no hay excepcion, el analisis sintactico fue exitoso
      System.out.println("Analisis sintactico exitoso. El archivo es generable por la gramatica.");

    } catch (Exception e) {
      e.printStackTrace();
      System.out.println("Analisis sintactico fallido. El archivo no es generable por la gramatica.");
    } 

  }
}