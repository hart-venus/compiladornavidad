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
        Lexer lexer = new Lexer(new StringReader("1 + 2 - 3")); 
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
        switch (token.sym) {
            case sym.PLUS: return "PLUS (+)";
            case sym.MINUS: return "MINUS (-)";
            case sym.NUMBER: return "NUMBER (" + token.value + ")";
            // Add other cases for different tokens
            default: return "UNKNOWN";
        }
    }
}
