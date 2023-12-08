package com.wanderariel;


import org.junit.Test;
import static org.junit.Assert.*;

import java_cup.runtime.Symbol;

/**
 * Unit test for simple App.
 */
public class AppTest 
{
    /**
     * Rigorous Test :-)
     */
    @Test
    public void testCupDependency() {
        Symbol symbol = new Symbol(0);
        assertNotNull(symbol);
    }
}
