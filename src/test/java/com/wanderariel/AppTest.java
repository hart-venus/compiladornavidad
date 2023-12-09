package com.wanderariel;

import org.junit.Test;
import static org.junit.Assert.*;

import java_cup.runtime.Symbol;

// AppTest.java
public class AppTest {
    @Test
    public void testCupDependency() {
        Symbol symbol = new Symbol(0);
        assertNotNull(symbol);
    }
}
