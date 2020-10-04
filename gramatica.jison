
/*--------------------------------------------analisis lexico--------------------------*/
%lex
%options case-insensitive
%%
/*----------------------------------------------palabras reservadas--------------------*/
"public"            %{return 'tk_public';%}
"static"            %{return 'tk_static';%}
"class"             %{return 'tk_class';%}
"interface"         %{return 'tk_interface';%}
"void"              %{return 'tk_void';%}
"main"              %{return 'tk_main';%}
"args"              %{return 'tk_args';%}
"int"               %{return 'tk_int';%}
"double"            %{return 'tk_double';%}
"char"              %{return 'tk_char';%}
"boolean"           %{return 'tk_boolean';%}
"String"            %{return 'tk_String';%}
"for"               %{return 'tk_for';%}
"while"             %{return 'tk_while';%}
"do"                %{return 'tk_do';%}
"break"             %{return 'tk_break';%}
"return"            %{return 'tk_return';%}
"continue"          %{return 'tk_continue';%}
"if"                %{return 'tk_if';%}
"else"              %{return 'else';%}

/*------------------------------------------------------------------------------------------*/
";"                 %{return 'punto_coma'; %}
"("                 %{return 'parentesis_izq'; %}
")"                 %{return 'parentesis_der'; %}
"["                 %{return 'corchete_izq'; %}
"]"                 %{return 'corchete_der'; %}
"{"                 %{return 'llave_izq'%}
"}"                 %{return 'llave_der'%}
"="                 %{return 'igual'; %}
","                 %{return 'coma'; %}
"."                 %{return 'punto'; %}
">"                 %{return 'mayor';%}
"<"                 %{return 'menor';%}
"!"                 %{return 'op_not';%}
"&&"                %{return 'op_and';%}
"||"                %{return 'op_or';%}
"!="                %{return 'op_not_igual';%}
">="                %{return 'op_mayor_igual';%}
"<="                %{return 'op_menor_igual';%}
"=="                %{return 'op_igual_igual';%}
"^"                 %{return 'op_xor';%}
"+"                 %{return 'mas'; %}
"-"                 %{return 'menos'; %}
"*"                 %{return 'producto'; %}
"/"                 %{return 'div'; %}

/* --------------------------especiales--------------------------------------*/

[ \r\t\f]+            %{ /*ignore */%}
\n                  %{/*it will count */%}
\s+                                 // se ignoran espacios en blanco
"//".*                              // comentario simple línea

/* EXPRESIONES REGULARES*/

\"[^\"]*\"              %{ yytext = yytext.substr(1,yyleng-2); return 'CADENA'; %}
[0-9]+("."[0-9]+)?\b    %{return 'decimal'; %}
[0-9]+\b                %{return 'entero'; %}
([a-zA-Z])[a-zA-Z0-9_]* %{return 'identificador'; %}

<<EOF>>                 %{return 'EOF'; %}

.                       { console.error('Este es un error léxico: ' + yytext + ', en la linea: ' + yylloc.first_line + ', en la columna: ' + yylloc.first_column); }

/lex



/*PARSER */


%start INICIO

%%

INICIO: INSTRUCCIONES EOF;

INSTRUCCIONES: TIPO_INSTRUCCION INSTRUCCIONES
            |  TIPO_INSTRUCCION
            |  error {console.error('Este es un error sintáctico: ' + yytext + ', en la linea: ' + this._$.first_line + ', en la columna: ' + this._$.first_column);}

;

TIPO_INSTRUCCION: tk_public tk_class identificador llave_der llave_izq /*clase*/
                | tk_public tk_interface identificador llave_der llave_izq /*interfaces*/ 
;




TIPO_DATO: tk_int
        | tk_double
        | tk_String
        | tk_boolean
        | tk_char
;

/*SENTENCIAS DE REPETICION

LISTA_SENTENCIA: SENTENCIAS LISTA_SENTENCIA
        | SENTENCIA

SENTENCIA: REPETICION
        | CONTROL
        | DECLARACION

REPETICION: for parentesis_izq DECLARACION punto_comma EXPRESION punto_comma EXPRESION parentesis_izq llave_izq llave_der
            |

*/


/*




*/
