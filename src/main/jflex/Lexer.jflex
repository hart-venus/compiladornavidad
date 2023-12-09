package com.wanderariel;
import java_cup.runtime.*;
import java.util.ArrayList;
import java.util.List;
import java.io.IOException;

%%

%class Lexer
%public
%unicode
%cup
%line
%column

%{
    StringBuffer sb = new StringBuffer();

    private Symbol symbol(int type) {
        return new Symbol(type, yyline, yycolumn);
    }
    private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline, yycolumn, value);
    }

    public List<Symbol> getTokens() {
        List<Symbol> tokens = new ArrayList<Symbol>();
        Symbol token;
        do {
            try {
                token = next_token();
            } catch (IOException e) {
                System.err.println(e.getMessage());
                return null;
            }
            tokens.add(token);
        } while (token.sym != sym.EOF);
        // quitar el token EOF
        tokens.remove(tokens.size()-1);
        return tokens;
    }
%}

// Regular Expressions
PLUS = \+
MINUS = \-
WHOLEDIVISION = \/\/
DIVISION = \/
MULTIPLICATION = \*
MOD = \~
POWER = \*\*

DIGIT = [0-9]
WHITE_SPACE = [ \t\f] | {LINE_TERMINATOR}
LINE_TERMINATOR = [\n\r\u2028\u2029]
INPUT_CHARACTER = [^{LINE_TERMINATOR}]

// Multiline comments start with /_ and end with _/
COMMENT = {MULTILINE_COMMENT} | {SINGLELINE_COMMENT} | {DOC_COMMENT}
MULTILINE_COMMENT = "/\_" [^\_] ~"\_/" | "/\_" "\_"+ "/"
SINGLELINE_COMMENT = "@" {INPUT_CHARACTER}* {LINE_TERMINATOR}?
DOC_COMMENT = "/\_\_" {COMMENT_CONTENT} "\_"+ "/"
COMMENT_CONTENT = ([^\_] | \_+ [^/\_])*

IDENTIFIER = [:jletter:] [:jletterdigit:]*
NUMBER = 0 | -?[1-9] {DIGIT}*
FLOATING_POINT_LITERAL = 0 | -?[1-9] {DIGIT}* "." {DIGIT}+

%state STRING

%%

/* palabras reservadas */
<YYINITIAL> "programa" { return symbol(sym.RODOLFO); }

<YYINITIAL> {
    {COMMENT} { /* ignore */ }
    \" { sb.setLength(0); yybegin(STRING); } // Inicia un literal de cadena
    {PLUS} { return symbol(sym.RODOLFO, yytext()); }
    {MINUS} { return symbol(sym.RODOLFO, yytext()); }
    {WHOLEDIVISION} { return symbol(sym.RELAMPAGO, yytext()); }
    {DIVISION} { return symbol(sym.RAYO, yytext()); }
    {POWER} { return symbol(sym.COMETA, yytext()); }
    {MULTIPLICATION} { return symbol(sym.DANZARIN, yytext()); }
    {MOD} { return symbol(sym.SALTARIN, yytext()); }
    {FLOATING_POINT_LITERAL} { return symbol(sym.GOATED, new Double(yytext())); }
    {NUMBER} { return symbol(sym.NUMBER, new Integer(yytext())); }
    {WHITE_SPACE} { /* ignore */ }
}

<STRING> {
    \" { yybegin(YYINITIAL); return symbol(sym.RODOLFO, sb.toString()); }
    [^\n\r\"\\] { sb.append(yytext()); }
    \\n { sb.append("\n"); }
    \\r { sb.append("\r"); }
    \\t { sb.append("\t"); }
    \\\" { sb.append("\""); }
    \\ { sb.append("\\"); }
}

// Fallback
[^] { throw new Error("Caracter illegal <"+yytext()+">" + " en la linea " + yyline + " y columna " + yycolumn); }
