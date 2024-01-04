package com.wanderariel;
import java_cup.runtime.*;
import java.util.ArrayList;
import java.util.List;
import java.io.IOException;
import java.util.Hashtable;

%%

%class Lexer
%public
%unicode
%cup
%line
%column

%{
    StringBuffer sb = new StringBuffer();

    /**
    * Método auxiliar para generar un símbolo con datos adicionales.
    * entrada: tipo de símbolo
    * salida: símbolo con datos adicionales
    * restricción: ninguna
    * objetivo: generar un símbolo con datos adicionales
    */  
    private Symbol symbol(int type) {
        return new Symbol(type, yyline, yycolumn);
    }
    /**
    * Método auxiliar para generar un símbolo con datos adicionales.
    * entrada: tipo de símbolo, valor del símbolo
    * salida: símbolo con datos adicionales
    * restricción: ninguna
    * objetivo: generar un símbolo con datos adicionales
    */
    private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline, yycolumn, value);
    }

    /**
    * Método publico para conseguir los tokens de un archivo.
    * entrada: ninguno
    * salida: lista de tokens
    * restricción: ninguna
    * objetivo: conseguir los tokens de un archivo
    */
    public List<Symbol> getTokens() {
        List<Symbol> tokens = new ArrayList<Symbol>();
        Symbol token;
        do {
            try {
                token = next_token();
                if (token.sym == sym.error_carbon) {
                    System.err.println("Error en la linea " + token.left + ", columna " + token.right + ": " + token.value + " no es un token valido.");
                    continue;
                }
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

    /**
    * Método publico para conseguir la cantidad de tokens de cada tipo de un archivo.
    * entrada: ninguno
    * salida: tabla de hash con la cantidad de tokens de cada tipo
    * restricción: ninguna
    * objetivo: conseguir la cantidad de tokens de cada tipo de un archivo
    */
    public Hashtable<Integer, Integer> getSymbolCount() {
        Hashtable<Integer, Integer> symbolCount = new Hashtable<Integer, Integer>();
        Symbol token;
        do {
            try {
                token = next_token();
                if (token.sym == sym.error_carbon) {
                    System.err.println("Error en la linea " + token.left + ", columna " + token.right + ": " + token.value + " no es un token valido.");
                    continue;
                }
            } catch (IOException e) {
                System.err.println(e.getMessage());
                return null;
            }
            if (symbolCount.containsKey(token.sym)) {
                symbolCount.put(token.sym, symbolCount.get(token.sym)+1);
            } else {
                symbolCount.put(token.sym, 1);
            }
        } while (token.sym != sym.EOF);
        return symbolCount;
    }
%}

// Regular Expressions
PLUS = \+
PLUSPLUS = \+\+
MINUS = \-
MINUSMINUS = \-\-
WHOLEDIVISION = \/\/
DIVISION = \/
MULTIPLICATION = \*
MOD = \~
POWER = \*\*

// Operaciones de comparacion
EQUAL = \=\=
DIFFERENT = \!\=
GREATER = \>
LESS = \<
GREATER_EQUAL = \=\>
LESS_EQUAL = \=\<

// Operandos logicos
AND = \^
OR = \#
NOT = \!

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
FLOATING_POINT_LITERAL = -? (0 "." {DIGIT}+ | [1-9] {DIGIT}* "." {DIGIT}+)
CHAR_LITERAL = \' {INPUT_CHARACTER} \'

BEGIN_PARENTHESIS = \(
END_PARENTHESIS = \)
BEGIN_BRACKET = \[
END_BRACKET = \]
BEGIN_BRACE = \{
END_BRACE = \}
PIPE = \|
ASSIGN = \<\=
SEPARATOR = \,

%state STRING

%%

/* palabras reservadas */
<YYINITIAL> "function" { return symbol(sym.function_chimenea, "function"); }
<YYINITIAL> "local" { return symbol(sym.local_dulce, "local"); }
<YYINITIAL> "null" { return symbol(sym.t_null_reno, "null"); }
<YYINITIAL> "int" { return symbol(sym.t_int_colacho, "int"); }
<YYINITIAL> "float" { return symbol(sym.t_float_santa, "float"); }
<YYINITIAL> "string" { return symbol(sym.t_string_kris, "string"); }
<YYINITIAL> "bool" { return symbol(sym.t_bool_noel, "bool"); }
<YYINITIAL> "char" { return symbol(sym.t_char_pascuero, "char"); }
<YYINITIAL> "true" { return symbol(sym.l_t_noel, "true"); }
<YYINITIAL> "false" { return symbol(sym.l_f_noel, "false"); }
<YYINITIAL> "if" { return symbol(sym.if_elfo, "if"); }
<YYINITIAL> "elif" { return symbol(sym.elif_hada, "elif"); }
<YYINITIAL> "else" { return symbol(sym.else_duende, "else"); }
<YYINITIAL> "for" { return symbol(sym.for_envuelve, "for"); }
<YYINITIAL> "do" { return symbol(sym.do_hace, "do"); }
<YYINITIAL> "until" { return symbol(sym.until_revisa, "until"); }
<YYINITIAL> "return" { return symbol(sym.return_envia, "return"); }
<YYINITIAL> "break" { return symbol(sym.break_corta, "break"); }
<YYINITIAL> "print" { return symbol(sym.print_habla, "print"); }
<YYINITIAL> "read" { return symbol(sym.read_escucha, "read"); }
<YYINITIAL> "main" { return symbol(sym.main_navidad, "main"); }


<YYINITIAL> {
    {COMMENT} { /* ignore */ }
    \" { sb.setLength(0); yybegin(STRING); } // Inicia un literal de cadena
    // Simbolos
    {BEGIN_PARENTHESIS} { return symbol(sym.p_abre_cuento, yytext()); }
    {END_PARENTHESIS} { return symbol(sym.p_cierra_cuento, yytext()); }
    {BEGIN_BRACKET} { return symbol(sym.p_abre_empaque, yytext()); }
    {END_BRACKET} { return symbol(sym.p_cierra_empaque, yytext()); }
    {BEGIN_BRACE} { return symbol(sym.cb_abre_regalo, yytext()); }
    {END_BRACE} { return symbol(sym.cb_cierra_regalo, yytext()); }
    {PIPE} { return symbol(sym.fin_regalo, yytext()); }
    {ASSIGN} { return symbol(sym.assign_entregar, yytext()); }
    {SEPARATOR} { return symbol(sym.sep_regalo, yytext()); }
    // Operaciones aritmeticas
    {PLUSPLUS} { return symbol(sym.op_inc_quien, yytext()); }
    {PLUS} { return symbol(sym.op_sum_cupido, yytext()); }
    {MINUSMINUS} { return symbol(sym.op_dec_grinch, yytext()); }
    {MINUS} { return symbol(sym.op_res_rodolfo, yytext()); }
    {DIVISION} { return symbol(sym.op_div_bailarin, yytext()); }
    {POWER} { return symbol(sym.op_pow_travieso, yytext()); }
    {MULTIPLICATION} { return symbol(sym.op_mul_cometa, yytext()); }
    {MOD} { return symbol(sym.op_mod_rayo, yytext()); }
    // Operaciones de comparacion
    {EQUAL} { return symbol(sym.op_eq_astuto, yytext()); }
    {DIFFERENT} { return symbol(sym.op_neq_chispa, yytext()); }
    {GREATER_EQUAL} { return symbol(sym.op_geq_feliz, yytext()); }
    {LESS_EQUAL} { return symbol(sym.op_leq_copito, yytext()); }
    {GREATER} { return symbol(sym.op_g_alegre, yytext()); }
    {LESS} { return symbol(sym.op_l_nevado, yytext()); }
    // Operandos logicos
    {AND} { return symbol(sym.op_and_melchor, yytext()); }
    {OR} { return symbol(sym.op_or_gaspar, yytext()); }
    {NOT} { return symbol(sym.op_not_baltasar, yytext()); }
    // identificadores
    {IDENTIFIER} { return symbol(sym.id_persona, yytext()); }
    // literales
    {CHAR_LITERAL} { return symbol(sym.l_char_pascuero, yytext()); }
    {FLOATING_POINT_LITERAL} { return symbol(sym.l_float_santa, new Double(yytext())); }
    {NUMBER} { return symbol(sym.l_int_colacho, new Integer(yytext())); }
    {WHITE_SPACE} { /* ignore */ }
}

// Cuando encuentra un literal de cadena,
// pasa a este estado para poder reconocer
// caracteres especiales
<STRING> {
    \" { yybegin(YYINITIAL); return symbol(sym.l_string_kris, sb.toString()); }
    [^\n\r\"\\] { sb.append(yytext()); }
    \\n { sb.append("\n"); }
    \\r { sb.append("\r"); }
    \\t { sb.append("\t"); }
    \\\" { sb.append("\""); }
    \\ { sb.append("\\"); }
}

// Fallback
[^] { return symbol(sym.error_carbon, yytext()); }
