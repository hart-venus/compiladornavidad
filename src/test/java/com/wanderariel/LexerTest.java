package com.wanderariel;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import java_cup.runtime.Symbol;
import org.junit.Test;
import static org.junit.Assert.assertEquals;

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
    List<Symbol> actualSymbols = lexer.getTokens();

    // Formato
    List<String> actualTokenIdentifiers = actualSymbols.stream()
        .map(symbol -> "#" + symbol.sym)
        .collect(Collectors.toList());

    // Basado en el contenido de int_literals.txt
    List<String> expectedTokenIdentifiers = Arrays.asList("#26", "#26", "#2", "#26");

    // Print actuales y esperados
    System.out.println("Actual token identifiers:");
    actualTokenIdentifiers.forEach(System.out::println);

    System.out.println("Expected token identifiers:");
    expectedTokenIdentifiers.forEach(System.out::println);

    // Compare actuales y esperados
    assertEquals(expectedTokenIdentifiers, actualTokenIdentifiers);
  }
}