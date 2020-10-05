
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
"+"					%{return 'mas';%}
"-"					%{return 'menos';%}
"*"					%{return 'por';%}
"/"					%{return 'dividido';%}


/* --------------------------especiales--------------------------------------*/

[ \r\t\f]+            %{ /*ignore */%}
\n                  %{/*it will count */%}
\s+                                 // se ignoran espacios en blanco
"//".*                              // comentario simple línea
[/][*][^*]*[*]+([^/*][^*]*[*]+)*[/] // comentario multiple líneas

/*---------------------- EXPRESIONES REGULARES-------------------------*/

\"[^\"]*\"              %{ yytext = yytext.substr(1,yyleng-2); return 'CADENA'; %}
[0-9]+("."[0-9]+)?\b    %{return 'decimal'; %}
[0-9]+\b                %{return 'entero'; %}
([a-zA-Z])[a-zA-Z0-9_]* %{return 'identificador'; %}

<<EOF>>                 %{return 'EOF'; %}

.                       { console.error('Este es un error léxico: ' + yytext + ', en la linea: ' + yylloc.first_line + ', en la columna: ' + yylloc.first_column); }

/lex



/*----------------------------PARSER ----------------------------------------------*/


/* Asociación de operadores y precedencia */

%left 'mas' 'menos'
%left 'por' 'dividido'
%left Umenos

%start INICIO

%%

INICIO: INSTRUCCIONES EOF;

INSTRUCCIONES: TIPO_INSTRUCCION INSTRUCCIONES
            |  TIPO_INSTRUCCION
           
;

TIPO_INSTRUCCION: tk_public tk_class identificador llave_izq LISTA_SUBINSTRUCCION llave_der 
                | tk_public tk_interface identificador llave_izq llave_der 
                | error llave_der {console.error('Este es un error sintáctico: ' + yytext + ', en la linea: ' + this._$.first_line + ', en la columna: ' + this._$.first_column);}

;


LISTA_SUBINSTRUCCION: SUB_INSTRUCCION LISTA_SUBINSTRUCCION
					| SUB_INSTRUCCION
;

SUB_INSTRUCCION:  TIPO_DATO identificador LISTA_VARIABLES punto_coma %{console.log("TIPO:"+$1+ " identificador:"+$2);%}
				| TIPO_DATO identificador LISTA_VARIABLES igual EXP_CADENA punto_coma %{console.log("TIPO:"+$1+ " identificador:"+$2 + " asignar "+$4);%}
				| identificador LISTA_VARIABLES igual EXP_CADENA punto_coma
                
;
LISTA_VARIABLES: coma identificador LISTA_VARIABLES %{console.log($1+ " identificador:"+$2);%}
				| ;



EXP_NUMERICA
	: menos EXP_NUMERICA %prec Umenos				
	| EXP_NUMERICA mas EXP_NUMERICA			
	| EXP_NUMERICA menos EXP_NUMERICA		
	| EXP_NUMERICA por EXP_NUMERICA			
	| EXP_NUMERICA dividido EXP_NUMERICA	
	| parentesis_izq parentesis_der PARDER					
	| entero											
	| decimal											
	| identificador										
;
EXP_CADENA
    : CADENA											
	| EXP_NUMERICA							
;

EXP_RELACIONAL
	: EXP_NUMERICA mayor EXP_NUMERICA		
	| EXP_NUMERICA menor EXP_NUMERICA		
	| EXP_NUMERICA op_mayor_igual EXP_NUMERICA	
	| EXP_NUMERICA op_menor_igual EXP_NUMERICA	
	| EXP_CADENA op_igual_igual EXP_CADENA			
	| EXP_CADENA op_not_igual EXP_CADENA			
;

EXP_LOGICA
	: EXP_RELACIONAL op_and EXP_RELACIONAL     
	| EXP_RELACIONAL op_or EXP_RELACIONAL 		
	| op_not EXP_RELACIONAL							
	| EXP_RELACIONAL								
;

TIPO_DATO: tk_int
        | tk_double
        | tk_String
        | tk_boolean
        | tk_char
;

/*





*/
