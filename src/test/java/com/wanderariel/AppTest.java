package com.wanderariel;

import static org.junit.Assert.assertNotNull;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java_cup.runtime.Symbol;
import org.junit.Test;

/** Función de pruebas unitarias.

* @param args argumentos de la función.
* @return void
*/

public class AppTest {
  
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

}
