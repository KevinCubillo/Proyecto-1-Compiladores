package com.compiladores;

import java_cup.runtime.*;

%%
%public
%class Lexer
%cup


letter = [a-zA-Z]

Integer = 0|[1-9][0-9]*
Float = {Integer}(\.[0-9]*)?
Boolean = T | F
String = \"(\\.|[^\"])*\"
Char = '[^']'
Identifier = {letter}({letter}|[0-9])*


%{
    StringBuffer string = new StringBuffer();

    private Symbol symbol(int type) {
        return new Symbol(type, yyline, yycolumn);
    }
    private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline, yycolumn, value);
    }
%}

%eofval{
    return symbol(ParserSym.EOF);
%eofval}

%%
"+" { return symbol(ParserSym.PLUS, yytext()); }
"-" { return symbol(ParserSym.MINUS, yytext()); }
"*" { return symbol(ParserSym.TIMES, yytext()); }
"(" { return symbol(ParserSym.LPAREN, yytext()); }
")" { return symbol(ParserSym.RPAREN, yytext()); }
"/" { return symbol(ParserSym.DIVIDE, yytext()); }
"%" { return symbol(ParserSym.MODULE, yytext()); }
"=" { return symbol(ParserSym.ASSIGN, yytext()); }
";" { return symbol(ParserSym.ENDLINE, yytext()); }
"==" { return symbol(ParserSym.EQUALS, yytext()); }
"!=" { return symbol(ParserSym.DIFFERENT, yytext()); }
">" { return symbol(ParserSym.GREATER, yytext()); }
"<" { return symbol(ParserSym.LESS, yytext()); }
">=" { return symbol(ParserSym.GREATEREQUAL, yytext()); }
"<=" { return symbol(ParserSym.LESSEQUAL, yytext()); }
"&" { return symbol(ParserSym.AND, yytext()); }
"|" { return symbol(ParserSym.OR, yytext()); }
"!" { return symbol(ParserSym.NOT, yytext()); }
"{" { return symbol(ParserSym.BLOCKSTART, yytext()); }
"}" { return symbol(ParserSym.BLOCKEND, yytext()); }
"," { return symbol(ParserSym.COMMA, yytext()); }
"#" { return symbol(ParserSym.SEPARATOR, yytext()); }
"if" { return symbol(ParserSym.IF, yytext()); }
"else" { return symbol(ParserSym.ELSE, yytext()); }
"return" { return symbol(ParserSym.RETURN, yytext()); }
"break" { return symbol(ParserSym.BREAK, yytext()); }
"for" { return symbol(ParserSym.FOR, yytext()); }
"in" { return symbol(ParserSym.IN, yytext()); }
"range" { return symbol(ParserSym.RANGE, yytext()); }
"while" { return symbol(ParserSym.WHILE, yytext()); }
"switch"  { return symbol(ParserSym.SWITCH, yytext()); }
"case" { return symbol(ParserSym.CASE, yytext()); }
":" { return symbol(ParserSym.DOTS, yytext()); }
"default" { return symbol(ParserSym.DEFAULT, yytext()); }
"read" { return symbol(ParserSym.READ, yytext()); }
">>" { return symbol(ParserSym.READSYMBOL, yytext()); }
"print" { return symbol(ParserSym.PRINT, yytext()); }
"<<" { return symbol(ParserSym.PRINTSYMBOL, yytext()); }
"int" { return symbol(ParserSym.INTEGERTYPE, yytext()); }
"float" { return symbol(ParserSym.FLOATTYPE, yytext()); }
"bool" { return symbol(ParserSym.BOOLEANTYPE, yytext()); }
"char" { return symbol(ParserSym.CHARTYPE, yytext()); }
"string" { return symbol(ParserSym.STRINGTYPE, yytext()); }
"true" { return symbol(ParserSym.TRUE, yytext()); }
"false" { return symbol(ParserSym.FALSE, yytext()); }
{Integer}+ { return symbol(ParserSym.INTEGER, Integer.valueOf(yytext())); }
{Float}+ { return symbol(ParserSym.FLOAT, Float.valueOf(yytext())); }
{Boolean}+ { return symbol(ParserSym.BOOLEAN, Boolean.valueOf(yytext())); }
{String}+ { return symbol(ParserSym.STRING, yytext()); }
{Char}+ { return symbol(ParserSym.CHAR, yytext()); }
{Identifier}+ { return symbol(ParserSym.IDENTIFIER, yytext()); }


   /*
"void" { return symbol(ParserSym.VOIDTYPE, yytext()); }
"null" { return symbol(ParserSym.NULL, yytext()); }

"//[^\\n]*" { /* Comentario de línea - No hace nada */}
"/*[^*]*\\*+([^/*][^*]*\\*+)*/" { /* Comentario de bloque - No hace nada */}
"\"[^\"\\n]*\"" { return symbol(ParserSym.TEXT, yytext()); }

    */
    */


[^] { throw new Error("Cadena no permitida <" + yytext() + ">"); } //cualquier otro caso