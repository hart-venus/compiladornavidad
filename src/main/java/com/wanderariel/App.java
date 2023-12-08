package com.wanderariel;
import java.io.Reader;
import java.io.StringReader;


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
        try {
            while(true){
                Tokens token = lexer.yylex();
                if (token == null) {
                    break;
                }
                System.out.println(token);
            }
        } catch (Exception e) {
            System.out.println("Revise parametros");
        }
    }
}
