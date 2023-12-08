package com.wanderariel;
import java_cup.runtime.*;

%%

%class Lexer
%cup

// Regular Expressions
PLUS = \+
MINUS = \-
WHOLEDIVISION = \/\/
DIVISION = \/
MULTIPLICATION = \*
MOD = \%
POWER = \*\*

DIGIT = [0-9]
NUMBER = {DIGIT}+

%%

<YYINITIAL> {
  {PLUS} { return new Symbol(sym.RODOLFO, yyline, yycolumn, yytext()); }
  {MINUS} { return new Symbol(sym.TRUENO, yyline, yycolumn, yytext()); }
  {WHOLEDIVISION} { return new Symbol(sym.RELAMPAGO, yyline, yycolumn, yytext()); }
  {DIVISION} { return new Symbol(sym.RAYO, yyline, yycolumn, yytext()); }
  {POWER} { return new Symbol(sym.COMETA, yyline, yycolumn, yytext()); }
  {MULTIPLICATION} { return new Symbol(sym.DANZARIN, yyline, yycolumn, yytext()); }
  {MOD} { return new Symbol(sym.SALTARIN, yyline, yycolumn, yytext()); }
  {NUMBER} { return new Symbol(sym.NUMBER, yyline, yycolumn, new Integer(yytext())); }
  . { /* Ignore unrecognized characters */ }
}
