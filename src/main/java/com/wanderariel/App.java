package com.wanderariel;
import java.io.Reader;
import java.io.StringReader;
import java_cup.runtime.Symbol;

/**
 * Hello world!
 *
 */

public class App 
{
    public static void main( String[] args )
    {
        // new string reader
        Reader reader = new StringReader("5 a = 5;");
        Lexer lexer = new Lexer(reader); 
    }
}
