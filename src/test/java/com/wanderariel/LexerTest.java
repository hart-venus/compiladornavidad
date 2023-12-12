package com.wanderariel;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.List;
import java_cup.runtime.Symbol;
import org.junit.Test;
import static org.junit.Assert.assertTrue;

/**
 * Clase de pruebas unitarias.
 * Entrada: ninguna.
 * Restricciones: ninguna.
 * Objetivo: probar el Lexer y el Parser.
 * Salida: ninguna.
 * 
 */
public class LexerTest {

  @Test 
  public void testIntLiterals() throws FileNotFoundException, IOException {
    Lexer lexer = new Lexer(new BufferedReader(new FileReader("src/main/test/int_literals.txt")));
    List<Symbol> expectedSymbols = lexer.getTokens();
    // print expected symbols
    System.out.println("Expected symbols:");
    assertTrue(expectedSymbols.size() == 4);

  }
}
