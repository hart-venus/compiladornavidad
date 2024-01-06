package com.wanderariel;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.StringReader;

import java_cup.runtime.Symbol;
import org.junit.Test;

/**
 * Clase de pruebas unitarias.
 * Entrada: ninguna.
 * Restricciones: ninguna.
 * Objetivo: probar el Lexer y el Parser.
 * Salida: ninguna.
 * 
 */

public class AppTest {

  @Test
  public void testSingleToken() throws IOException {
    Lexer lexer = new Lexer(new StringReader("42"));
    assertEquals(sym.l_int_colacho, lexer.next_token().sym);
  }

  @Test
  public void testSingleFloatToken() throws IOException {
    Lexer lexer = new Lexer(new StringReader("3.14"));
    assertEquals(sym.l_float_santa, lexer.next_token().sym);
  }

  @Test
  public void testSingleIdentifierToken() throws IOException {
    Lexer lexer = new Lexer(new StringReader("variable"));
    assertEquals(sym.id_persona, lexer.next_token().sym);
  }

  @Test
  public void testArithmeticExpression() throws IOException {
    Lexer lexer = new Lexer(new StringReader("a + b * (c - 2)"));
    assertEquals(sym.id_persona, lexer.next_token().sym);
    assertEquals(sym.op_sum_cupido, lexer.next_token().sym);
    assertEquals(sym.id_persona, lexer.next_token().sym);
    assertEquals(sym.op_mul_cometa, lexer.next_token().sym);
    assertEquals(sym.p_abre_cuento, lexer.next_token().sym);
    assertEquals(sym.id_persona, lexer.next_token().sym);
    assertEquals(sym.op_res_rodolfo, lexer.next_token().sym);
    assertEquals(sym.l_int_colacho, lexer.next_token().sym);
    assertEquals(sym.p_cierra_cuento, lexer.next_token().sym);
  }

  @Test
  public void testStringLiteral() throws IOException {
    Lexer lexer = new Lexer(new StringReader("\"Hello, World!\""));
    assertEquals(sym.l_string_kris, lexer.next_token().sym);
  }

  @Test
  public void testCupDependency() {
    Symbol symbol = new Symbol(0);
    assertNotNull(symbol);
  }

  @Test
  public void testLexerImport() {
    Lexer lexer = new Lexer(null);
    assertNotNull(lexer);
  }

  @Test
  public void testParserImport() {
    parser parser = new parser(null);
    assertNotNull(parser);
  }

  @Test
  public void testSyms() {
    assertNotNull(sym.terminalNames);
  }

  @Test
  public void testEscapeCharacters() throws IOException {
    Lexer lexer = new Lexer(new StringReader("\"Escape \\\" character\""));
    assertEquals(sym.l_string_kris, lexer.next_token().sym);
  }

  @Test
  public void testMultilineString() throws IOException {
    Lexer lexer = new Lexer(new StringReader("\"Multiline\\nString\\n\""));
    assertEquals(sym.l_string_kris, lexer.next_token().sym);
  }
}
