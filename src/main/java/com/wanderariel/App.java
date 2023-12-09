package com.wanderariel;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
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

    try (BufferedReader reader = new BufferedReader(new FileReader(fileName))) {
      Lexer lexer = new Lexer(reader);

      for (Symbol token : lexer.getTokens()) {
        System.out.println(tokenToString(token));
      }
    } catch (IOException e) {
      e.printStackTrace();
    }

    String[][] rows = {{"ad", "bd", "cd"}, {"dd", "ed", "fd"}};
    MarkdownTablePrinter printer = new MarkdownTablePrinter(rows, "test.md");
    printer.print();


  }
  

  private static String tokenToString(Symbol token) {
    return sym.terminalNames[token.sym] + " " + token.value + " Line: "
            + token.left + " Column: " + token.right + "\n";
  }
}