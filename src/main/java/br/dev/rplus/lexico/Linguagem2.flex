package br.dev.rplus.lexico;

import br.dev.rplus.sintatico.Simbolos;
import java_cup.runtime.Symbol;

%%

%class AnalisadorLexico
%cup
%unicode
%public
%line
%column
%eofval{
    return new Symbol(Simbolos.EOF, "Fim do arquivo");
%eofval}
%standalone
%{
    private Symbol createSymbol(int type) {
        return new Symbol(type, yyline, yycolumn);
    }

    private Symbol createSymbol(int type, Object value) {
        return new Symbol(type, yyline, yycolumn, value);
    }
%}

/* Definições */
letra = [a-zA-Z]
digito = [0-9]
aspa = \"
apostrofo = \'
espaco = [\t\f\r\n ]
string_vazia = {aspa}{aspa}
string = {aspa} [^\"]+ {aspa}
string_caracter = {apostrofo} [^\']+ {apostrofo}
string_caracter_vazio = {apostrofo} {apostrofo}
id = {letra}({letra}|{digito})*

/* Regras */
%%

"function" {return createSymbol(Simbolos.FUNCTION);}
"if" {return createSymbol(Simbolos.IF);}
"elif" {return createSymbol(Simbolos.ELIF);}
"else" {return createSymbol(Simbolos.ELSE);}
"int" {return createSymbol(Simbolos.INT);}
"str" {return createSymbol(Simbolos.STR);}
"char" {return createSymbol(Simbolos.CHAR);}
"bool" {return createSymbol(Simbolos.BOOL);}
"real" {return createSymbol(Simbolos.REAL);}
"void" {return createSymbol(Simbolos.VOID);}
"return" {return createSymbol(Simbolos.RETURN);}
"for" {return createSymbol(Simbolos.FOR);}
"in" {return createSymbol(Simbolos.IN);}
"true" {return createSymbol(Simbolos.TRUE);}
"false" {return createSymbol(Simbolos.FALSE);}
"while" {return createSymbol(Simbolos.WHILE);}
"input" {return createSymbol(Simbolos.INPUT);}
"print" {return createSymbol(Simbolos.PRINT);}

"==" {return createSymbol(Simbolos.OP_COMPARACAO);}
"<" {return createSymbol(Simbolos.OP_MENOR);}
">=" {return createSymbol(Simbolos.OP_MAIORIGUAL);}
"<=" {return createSymbol(Simbolos.OP_MENORIGUAL);}
">" {return createSymbol(Simbolos.OP_MAIOR);}
"=" {return createSymbol(Simbolos.OP_ATRIBUICAO);}

"and" {return createSymbol(Simbolos.OP_E);}
"or" {return createSymbol(Simbolos.OP_OU);}
"not" {return createSymbol(Simbolos.OP_NOT);}

"+" {return createSymbol(Simbolos.OP_ADICAO);}
"-" {return createSymbol(Simbolos.OP_SUBTRACAO);}
"/" {return createSymbol(Simbolos.OP_DIV);}
"*" {return createSymbol(Simbolos.OP_MULT);}

"(" {return createSymbol(Simbolos.ABRIR_PAR);}
")" {return createSymbol(Simbolos.FECHAR_PAR);}
"{" {return createSymbol(Simbolos.ABRIR_BLOCO);}
"}" {return createSymbol(Simbolos.FECHAR_BLOCO);}
"," {return createSymbol(Simbolos.VIRGULA);}
"." {return createSymbol(Simbolos.PONTO);}

{id} {return createSymbol(Simbolos.ID);}
{string_vazia} {return createSymbol(Simbolos.STRING_VAZIA);}
{string} {return createSymbol(Simbolos.STRING);}
{string_caracter} {return createSymbol(Simbolos.STRING_CHAR);}
{string_caracter_vazio} {return createSymbol(Simbolos.STRING_CHAR);}
{digito}+ {return createSymbol(Simbolos.CONSTANTE);}
{espaco}+ {}
. { System.out.println("Caracter ilegal: " + yytext() + " na linha: " + yyline + " coluna: " + yychar); }
