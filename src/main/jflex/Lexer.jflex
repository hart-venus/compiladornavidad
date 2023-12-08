package com.wanderariel;
import java_cup.runtime.Symbol;
import java.io.*;
%%

%class Lexer
%cup
%line
%column

// Define the symbols
SYMBOL = [+\-*/=()]


%%

// Rules section
<YYINITIAL> {
  {SYMBOL} {
    Symbol sym = new Symbol(sym.SYMBOL, yyline, yycolumn, yytext());
    return sym;
  }

  // You can add more rules for other tokens here

  \n { /* Handle new line */ }
  [ \t\r]+ { /* Ignore whitespaces */ }
}
