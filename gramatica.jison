
/*--------------------------------------------analisis lexico--------------------------*/
%lex
%options case-insensitive
%%
";"                 %{return 'PT_COMA'; %}
"("                 %{return 'PAR_IZQ'; %}
")"                 %{return 'PAR_DER'; %}
"["                 %{return 'COR_IZQ'; %}
"]"                 %{return 'COR_DER'; %}
"="                 %{return 'IGUAL'; %}
","                 %{return 'COMA'; %}
"."                 %{return 'PUNTO' %}

"+"                 %{return 'MAS'; %}
"-"                 %{return 'MENOS'; %}
"*"                 %{return 'POR'; %}
"/"                 %{return 'DIVIDIDO'; %}

/* Espacios en blanco */
[ \r\t\f]+            %{ /*ignore */%}
\n                  %{/*it will count */%}
\s+                                 // se ignoran espacios en blanco
"//".*                              // comentario simple línea

/* EXPRESIONES REGULARES*/


[0-9]+("."[0-9]+)?\b    %{return 'DECIMAL'; %}
[0-9]+\b                %{return 'entero'; %}
([a-zA-Z])[a-zA-Z0-9_]* %{return 'identificador'; %}

<<EOF>>                 %{return 'EOF'; %}

.                       { console.error('Este es un error léxico: ' + yytext + ', en la linea: ' + yylloc.first_line + ', en la columna: ' + yylloc.first_column); }

/lex

/*SINTACTIO*/

%start INICIO

%%

INICIO: identificador EOF;