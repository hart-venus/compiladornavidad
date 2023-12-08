%%
%class MyLexer
%unicode
%public
%standalone

// Regular Expressions
DIGIT = [0-9]
LETTER = [a-zA-Z]
WORD = {LETTER}+
NUMBER = {DIGIT}+
PUNCTUATION = [.,;!?]

%%

// Rules
<YYINITIAL> {
    {WORD}       { System.out.println("Word: " + yytext()); }
    {NUMBER}     { System.out.println("Number: " + yytext()); }
    {PUNCTUATION} { System.out.println("Punctuation: " + yytext()); }
    .            { System.out.println("Unknown character: " + yytext()); }
}
