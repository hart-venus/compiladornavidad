package com.wanderariel;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Una clase que imprime una tabla de markdown a un archivo.   
 * Entrada: una lista de arreglos de strings y un nombre de archivo.
 * Restricciones: el nombre de archivo debe ser valido.
 * Salida: un archivo con la tabla de markdown.
 * Objetivo: generar un archivo de salida con la tabla de tokens.
 */
public class MarkdownTablePrinter {
  private List<String[]> rowsList;
  private String fileName;

  /**
   * Constructor que recibe una lista de arreglos de strings y un nombre de archivo.
   * Entrada: una lista de arreglos de strings y un nombre de archivo.
   * Restricciones: el nombre de archivo debe ser valido.
   * Objetivo: generar un archivo de salida con la tabla de tokens.
   * Salida: un archivo con la tabla de markdown.
   */
  public MarkdownTablePrinter(String[][] rows, String fileName) {
    this.rowsList = new ArrayList<String[]>();
    this.fileName = fileName;
    for (String[] row : rows) {
      this.rowsList.add(row);
    }
  }

  /**
   * Sobrecarga del constructor que recibe una lista de arreglos de strings y un nombre de archivo.
   * Entrada: una lista de arreglos de strings y un nombre de archivo.
   * Restricciones: el nombre de archivo debe ser valido.
   * Objetivo: generar un archivo de salida con la tabla de tokens.
   * Salida: un archivo con la tabla de markdown.
   */
  public MarkdownTablePrinter(List<String[]> rows, String fileName) {
    this.rowsList = rows;
    this.fileName = fileName;
  }

  /**
   * Método principal que imprime la tabla de markdown a un archivo.
   * Entrada: ninguna.
   * Restricciones: ninguna.
   * Objetivo: generar un archivo de salida con la tabla de tokens.
   * Salida: un archivo con la tabla de markdown.
   */
  public void print() {
    try {
      writeMarkdownTableToFile(fileName, this.rowsList);
    } catch (IOException e) {
      e.printStackTrace();
    }
  }

  /**
   * Método que escribe la tabla de markdown a un archivo.
   * Entrada: una lista de arreglos de strings y un nombre de archivo.
   * Restricciones: el nombre de archivo debe ser valido.
   * Objetivo: generar un archivo de salida con la tabla de tokens.
   * Salida: un archivo con la tabla de markdown.
   * 
   */
  private static void writeMarkdownTableToFile(String fileName, List<String[]> rows) 
      throws IOException {
    try (BufferedWriter writer = new BufferedWriter(new FileWriter(fileName))) {
      int[] columnWidths = getColumnWidths(rows);
      writeRow(writer, rows.get(0), columnWidths, true);
      for (int i = 1; i < rows.size(); i++) {
        writeRow(writer, rows.get(i), columnWidths, false);
      }
    }
  }

  /**
   * Método auxiliar que obtiene el ancho de las columnas de la tabla.
   * Entrada: una lista de arreglos de strings.
   * Restricciones: ninguna.
   * Objetivo: conseguir el padding correcto para la tabla de markdown,
   * para que sea legible como tabla.
   * Salida: un arreglo de enteros con el ancho de las columnas.
   * 
   */
  private static int[] getColumnWidths(List<String[]> rows) {
    int numColumns = rows.get(0).length;
    int[] widths = new int[numColumns];

    for (String[] row : rows) {
      for (int i = 0; i < row.length; i++) {
        widths[i] = Math.max(widths[i], row[i].length());
      }
    }
    return widths;
  }

  /**
   * Método auxiliar que escribe una fila de la tabla de markdown a un archivo.
   * Entrada: una lista de arreglos de strings, un arreglo de enteros con el ancho de las columnas,
   * y un booleano que indica si la fila es la cabecera de la tabla.
   * Restricciones: ninguna.
   * Objetivo: generar un archivo de salida con la tabla de tokens.
   * Salida: un archivo con la tabla de markdown.
   * 
   */
  private static void 
      writeRow(BufferedWriter writer, String[] row, int[] columnWidths, boolean isHeader) 
      throws IOException {
    writer.write("|");
    for (int i = 0; i < row.length; i++) {
      writer.write(String.format(" %-" + columnWidths[i] + "s |", row[i]));
    }
    writer.newLine();
    if (isHeader) {
      writer.write("|");
      for (int width : columnWidths) {
        writer.write(String.join("", " ", repeat('-', width), " |"));
      }
      writer.newLine();
    }
  }

  /*
   * Método auxiliar que repite un caracter n veces.
   * Entrada: un caracter y un entero.
   * Restricciones: ninguna.
   * Objetivo: compatibilidad con versiones anteriores de Java.
   * Salida: un string con el caracter repetido n veces.
   * 
   */
  private static String repeat(char ch, int times) {
    StringBuilder sb = new StringBuilder();
    for (int i = 0; i < times; i++) {
      sb.append(ch);
    }
    return sb.toString();
  }
}
