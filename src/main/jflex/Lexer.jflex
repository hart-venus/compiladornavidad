package com.wanderariel;
import java_cup.runtime.*;

%%

%class Lexer
%cup

// Regular Expressions
PLUS = \+
MINUS = \-
DIGIT = [0-9]
NUMBER = {DIGIT}+

%%

<YYINITIAL> {
  {PLUS} { return new Symbol(sym.PLUS, yyline, yycolumn, yytext()); }
  {MINUS} { return new Symbol(sym.MINUS, yyline, yycolumn, yytext()); }
  {NUMBER} { return new Symbol(sym.NUMBER, yyline, yycolumn, new Integer(yytext())); }
  . { /* Ignore unrecognized characters */ }
}
