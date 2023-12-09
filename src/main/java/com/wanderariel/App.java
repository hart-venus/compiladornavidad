package com.wanderariel;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java_cup.runtime.Symbol;

/**
 * Hello world.
 *
 */

public class App {
  /**
   * Clase principal que agarra el Lexer previamente generado y lo prueba con
   * la entrada del archivo de prueba.
   */
  public static void main(String[] args) {
    // Conseguir primer argumento
    String fileName; 
    if (args.length > 0) {
      fileName = args[0];
    } else {
      fileName = "src/main/test/merryc.txt";
    }

    String outputPath;
    if (args.length > 1) {
      outputPath = args[1];
    } else {
      outputPath = "src/main/test/merryc.md";
    }

    List<String[]> rows = new ArrayList<String[]>();    
    rows.add(new String[] {"Lexema", "Token", "Codigo de Token", "Linea", "Columna"});
    try (BufferedReader reader = new BufferedReader(new FileReader(fileName))) {
      Lexer lexer = new Lexer(reader);

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

    MarkdownTablePrinter printer = new MarkdownTablePrinter(rows, outputPath);
    printer.print();
  }
}