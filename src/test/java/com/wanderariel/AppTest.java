package com.wanderariel;

import static org.junit.Assert.assertNotNull;

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
}
