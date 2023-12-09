package com.wanderariel;

import java.io.StringReader;
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
    // new string reader
    Lexer lexer = new Lexer(new StringReader("1 / 2 // 3 ** 5 ")); 
    Symbol token; 
    try {
      while ((token = lexer.next_token()).sym != sym.EOF) {
        System.out.println(tokenToString(token));
      }
    } catch (Exception e) {
      System.out.println(e);
    }
  }

  private static String tokenToString(Symbol token) {
    return sym.terminalNames[token.sym] + " " + token.value + " Line: " 
      + token.left + " Column: " + token.right + "\n";

  }
}