package br.dev.rplus.lexico;
import br.dev.rplus.sintatico.Tokens;
import java_cup.runtime.Symbol;


%%

%class AnalisadorLexico
%cup
%unicode
%public
%line
%column
%eofval{
	return new Symbol(Tokens.EOF, new String("Fim do arquivo"));
%eofval}
%standalone
%{
    /* To create a new java_cup.runtime.Symbol with information about
       the current token, the token will have no value in this
       case. */
    private Symbol symbol(int type) {
        return new Symbol(type, yyline, yycolumn);
    }

    /* Also creates a new java_cup.runtime.Symbol with information
       about the current token, but this object has a value. */
    private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline, yycolumn, value);
    }
%}

letra = [a-zA-Z]
digito = [0-9]
aspa = [\"]
apostrofo = [\']
espaco = ´[\t|\f|" "|\r|\n]
string_vazia = {aspa}{aspa}
string = {aspa} [^\"]+ {aspa}
string_caracter = {apostrofo} [^\']+ {apostrofo}
string_caracter_vazio = {apostrofo} {apostrofo}
id = {letra}({letra}|{digito})*

%%

/* Palavras Chave */
"function" {return new Symbol(Tokens.FUNCTION, yychar, yyline, yytext());}
"if" {return new Symbol(Tokens.IF, yychar, yyline, yytext());}
"elif" {return new Symbol(Tokens.ELIF, yychar, yyline, yytext());}
"else" {return new Symbol(Tokens.ELSE, yychar, yyline, yytext());}
"int" {return new Symbol(Tokens.INT, yychar, yyline, yytext());}
"str" {return new Symbol(Tokens.STR, yychar, yyline, yytext());}
"char" {return new Symbol(Tokens.CHAR, yychar, yyline, yytext());}
"bool" {return new Symbol(Tokens.BOOL, yychar, yyline, yytext());}
"real" {return new Symbol(Tokens.REAL, yychar, yyline, yytext());}
"void" {return new Symbol(Tokens.VOID, yychar, yyline, yytext());}
"return" {return new Symbol(Tokens.RETURN, yychar, yyline, yytext());}
"for" {return new Symbol(Tokens.FOR, yychar, yyline, yytext());}
"in" {return new Symbol(Tokens.IN, yychar, yyline, yytext());}
"true" {return new Symbol(Tokens.TRUE, yychar, yyline, yytext());}
"false" {return new Symbol(Tokens.FALSE, yychar, yyline, yytext());}
"while" {return new Symbol(Tokens.WHILE, yychar, yyline, yytext());}
"input" {return new Symbol(Tokens.INPUT, yychar, yyline, yytext());}
"print" {return new Symbol(Tokens.PRINT, yychar, yyline, yytext());}

/* Operadores */
"==" {return new Symbol(Tokens.OP_COMPARACAO, yychar, yyline, yytext());}
"<" {return new Symbol(Tokens.OP_MENOR, yychar, yyline, yytext());}
">=" {return new Symbol(Tokens.OP_MAIORIGUAL, yychar, yyline, yytext());}
"<=" {return new Symbol(Tokens.OP_MENORIGUAL, yychar, yyline, yytext());}
">" {return new Symbol(Tokens.OP_MAIOR, yychar, yyline, yytext());}
"=" {return new Symbol(Tokens.OP_ATRIBUICAO, yychar, yyline, yytext());}

/* Operatores logicos */
"and" {return new Symbol(Tokens.OP_E, yychar, yyline, yytext());}
"or" {return new Symbol(Tokens.OP_OU, yychar, yyline, yytext());}
"not" {return new Symbol(Tokens.OP_NOT, yychar, yyline, yytext());}

/* Operadores aritimeticos */
"+" {return new Symbol(Tokens.OP_ADICAO, yychar, yyline, yytext());}
"-"	{return new Symbol(Tokens.OP_SUBTRACAO, yychar, yyline, yytext());}
"/"	{return new Symbol(Tokens.OP_DIV, yychar, yyline, yytext());}
"*"	{return new Symbol(Tokens.OP_MULT, yychar, yyline, yytext());}


/* Caracteres unicos */
"(" {return new Symbol(Tokens.ABRIR_PAR, yychar, yyline, yytext());}
")" {return new Symbol(Tokens.FECHAR_PAR, yychar, yyline, yytext());}
"{" {return new Symbol(Tokens.ABRIR_BLOCO, yychar, yyline, yytext());}
"}" {return new Symbol(Tokens.FECHAR_BLOCO, yychar, yyline, yytext());}
"," {return new Symbol(Tokens.VIRGULA, yychar, yyline, yytext());}
"." {return new Symbol(Tokens.PONTO, yychar, yyline, yytext());}

/* Expressoes regulares compostas */


{id}	{return new Symbol(Tokens.ID, yychar, yyline, yytext());}
{string_vazia} {return new Symbol(Tokens.STRING_VAZIA, yychar, yyline, yytext());}
{string} {return new Symbol(Tokens.STRING, yychar, yyline, yytext());}
{string_caracter} {return new Symbol(Tokens.STRING_CHAR, yychar, yyline, yytext());}
{string_caracter_vazio}	{return new Symbol(Tokens.STRING_CHAR, yychar, yyline, yytext());}
{digito}+ {return new Symbol(Tokens.CONSTANTE, yychar, yyline, yytext());}
{espaco}+ {}
