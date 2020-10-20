%{
	//const Nodo = require('./AstTree');
%}
/*--------------------------------------------analisis lexico--------------------------*/
%lex
%options case-insensitive
%%


[/][*][^*]*[*]+([^/*][^*]*[*]+)*[/]		 %{return 'cm_multiple'; %}	// comentario multiple líneas		
"//".*									 %{return 'cm_simple'; %}	// comentario simple línea

/*----------------------------------------------palabras reservadas--------------------*/
"public"            %{return 'tk_public';%}
"static"            %{return 'tk_static';%}
"class"             %{return 'tk_class';%}
"interface"         %{return 'tk_interface';%}
"void"              %{return 'tk_void';%}
"main"              %{return 'tk_main';%}
"args"              %{return 'tk_args';%}
"System"			%{return 'tk_System';%}
"out"				%{return 'tk_out';%}
"print"				%{return 'tk_print';%}
"println"			%{return 'tk_println';%}
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
"else"              %{return 'tk_else';%}

/*------------------------------------------------------------------------------------------*/
";"                 %{return 'punto_coma'; %}
"("                 %{return 'parentesis_izq'; %}
")"                 %{return 'parentesis_der'; %}
"["                 %{return 'corchete_izq'; %}
"]"                 %{return 'corchete_der'; %}
"{"                 %{return 'llave_izq'%}
"}"                 %{return 'llave_der'%}
","                 %{return 'coma'; %}
"."                 %{return 'punto'; %}
">="                %{return 'op_mayorigual';%}
"<="                %{return 'op_menor_igual';%}
"&&"                %{return 'op_and';%}
"||"                %{return 'op_or';%}
"!="                %{return 'op_not_igual';%}
"=="                %{return 'op_igual_igual';%}
"+"					%{return 'mas';%}
"-"					%{return 'MENOS';%}
"*"					%{return 'por';%}
"/"					%{return 'dividido';%}
"^"                 %{return 'op_xor';%}
">"                 %{return 'mayor';%}
"<"                 %{return 'menor';%}
"="                 %{return 'igual'; %}
"!"                 %{return 'op_not';%}
/* --------------------------especiales--------------------------------------*/

[ \r\t\f]+            %{ /*ignore */%}
\n                  %{/*it will count */%}
\s+                                 // se ignoran espacios en blanco
	

/*---------------------- EXPRESIONES REGULARES-------------------------*/

\"[^\"]*\"              %{ return 'CADENA';%}
"'"[^']"'"				%{return 'Caracter';%}
[0-9]+("."[0-9]+)?\b    %{return 'decimal'; %}
[0-9]+\b                %{return 'entero'; %}
([a-zA-Z])[a-zA-Z0-9_]* %{return 'identificador'; %}

<<EOF>>                 %{return 'EOF'; %}

.                       { console.error('Este es un error léxico: ' + yytext + ', en la linea: ' + yylloc.first_line + ', en la columna: ' + yylloc.first_column); }

/lex



/*----------------------------PARSER ----------------------------------------------*/


/* Asociación de operadores y precedencia */

%left 'mas' 'MENOS'
%left 'por' 'dividido'
%left 'op_xor'
%right 'UMENOS'

%start INICIO

%%

INICIO: INSTRUCCIONES EOF  { $$=`${$1}`; return $$; };

INSTRUCCIONES: INSTRUCCIONES TIPO_INSTRUCCION {$$ =`${$1}${$2}`; }
            |  TIPO_INSTRUCCION {$$ =`${$1}`; }

           
;

TIPO_INSTRUCCION: tk_public tk_class identificador llave_izq LISTA_METODO_FUNCION llave_der { $$ = `${$2} ${$3} ${$4} \n${$5} \n${$6}\n`;}
                | tk_public tk_interface identificador llave_izq SUB_INSTRUCCION_INTERFACE llave_der { }
				| cm_multiple {$$ =`${$1}\n`; }
				| cm_simple {$$ =`${$1}\n`; }
;

LISTA_METODO_FUNCION: LISTA_METODO_FUNCION METODO_FUNCION  {  $$ =`${$1}${$2}`;}
					| METODO_FUNCION {$$ =`${$1}`;}
;

METODO_FUNCION:   tk_public tk_void identificador parentesis_izq PARAMETROS_METODO_FUNCION parentesis_der llave_izq LISTA_SUBINSTRUCCION llave_der {$$=`\t ${$3}${$4}${$5}${$6}${$7}\n${$8}\n`;}																																													}
				| tk_public TIPO_DATO identificador parentesis_izq PARAMETROS_METODO_FUNCION parentesis_der llave_izq LISTA_SUBINSTRUCCION SENTENCIA_RETURN punto_coma llave_der {$$=`\t function ${$3}${$4}${$5}${$6}${$7}\n${$8}${$9};\n${$11}\n`;}
				| tk_public tk_static tk_void tk_main parentesis_izq tk_String corchete_izq corchete_der tk_args parentesis_der llave_izq LISTA_SUBINSTRUCCION llave_der {$$=``;}
				| cm_multiple {$$ =`${$1}`; }
				| cm_simple {$$ =`${$1}`; }
				| DECLARACION { $$ =`${$1}`; }
;



SUB_INSTRUCCION_INTERFACE:  SUB_INSTRUCCION_INTERFACE LLAMADA_METODO {	}
						 | LLAMADA_METODO {}
;



LISTA_SUBINSTRUCCION: LISTA_SUBINSTRUCCION SUB_INSTRUCCION  { $$ =`${$1}\n${$2}`;}
					| SUB_INSTRUCCION {$$ =`${$1}`;}
;

SUB_INSTRUCCION: 
			     DECLARACION {$$ = `${$1}`;}
				|LLAMADA_METODO {$$ = `${$1}`;}
				| tk_for parentesis_izq DECLARACION EXP_LOGICA punto_coma  identificador DECLARACION_CONTADOR parentesis_der llave_izq LISTA_SUBINSTRUCCION SENTENCIA_BC llave_der {$$=`\t for${$2}${$3}${$4}${$5}${$6}${$7}${$8}${$9}\n${$10}\n${$11}\n${$12}\n`;}
				| tk_while parentesis_izq EXP_LOGICA parentesis_der llave_izq LISTA_SUBINSTRUCCION SENTENCIA_BC  llave_der {$$=`\t while(${$3})${$5}\n${$6}\n${$7}\n${$8}\n`;}
				| tk_do llave_izq LISTA_SUBINSTRUCCION SENTENCIA_BC llave_der tk_while parentesis_izq EXP_LOGICA parentesis_der punto_coma {$$ = `\t do${$2}\n${$3}\n${$4}\n${$5}while${$7}${$8}${$9};\n`;}
				| SENTENCIA_CONTROL {$$=`${$1}`;}
				| SENTENCIA_IMPRIMIR{$$= `${$1}`;}
				| cm_multiple {$$ =`${$1}`; }
				| cm_simple {$$ =`${$1}`; }
				

;
SENTENCIA_IMPRIMIR:
				tk_System punto tk_out punto tk_println parentesis_izq EXP_NUMERICA parentesis_der punto_coma {$$ = `\t console.log(${$7});\n`;}
				| tk_System punto tk_out punto tk_print parentesis_izq EXP_NUMERICA parentesis_der punto_coma {$$ = `\t console.log(${$7});\n`;}
																																							}
;

SENTENCIA_CONTROL:
				  tk_if parentesis_izq EXP_LOGICA parentesis_der llave_izq SUB_INSTRUCCION llave_der  { $$=` if${$2}${$3}${$4}${$5}\n${$6}\n${$7}\n`;}															
				| tk_if parentesis_izq EXP_LOGICA parentesis_der llave_izq SUB_INSTRUCCION llave_der tk_else llave_izq SUB_INSTRUCCION llave_der  {$$=` if${$2}${$3}${$4}${$5}\n${$6}\n${$7}else${$9}\n${$10}\n${$11}\n`;}
				| tk_if parentesis_izq EXP_LOGICA parentesis_der llave_izq SUB_INSTRUCCION llave_der tk_else SENTENCIA_CONTROL {$$=` if${$2}${$3}${$4}${$5}\n${$6}\n${$7}else${$9}`;}
				;



DECLARACION:    TIPO_DATO LISTA_VARIABLES punto_coma {$$ = `\t let ${$2};\n`;}
				| TIPO_DATO LISTA_VARIABLES igual EXP_NUMERICA punto_coma { $$ =`\t let ${$2}${$3}${$4}${$5}\n`;}
				| LISTA_VARIABLES igual EXP_NUMERICA punto_coma {$$ = `\t ${$1}${$2}${$3}${$4}\n`;}
				| identificador mas mas punto_coma { $$=`\t ${$1}${$2}${$3}${$4}\n`;}
				| identificador MENOS MENOS punto_coma { $$=`\t ${$1}${$2}${$3}${$4}\n`;}
				
				
;

DECLARACION_CONTADOR:  mas mas { $$ = `++`; }
					|  MENOS MENOS { $$ = `--`; }

;

LISTA_VARIABLES: LISTA_VARIABLES coma identificador  {$$ =`${$1}${$2}${$3}`;}
				| identificador {$$ = `${$1}`;}
;


PARAMETROS_METODO_FUNCION: TIPO_DATO EXP_NUMERICA L_PARAMETROS_METODO_FUNCION { $$=`${$2}${$3}${$4}`; }
						| TIPO_DATO EXP_NUMERICA {$$=`${$2}`;}
						| {$$=``;}; 

L_PARAMETROS_METODO_FUNCION: L_PARAMETROS_METODO_FUNCION coma TIPO_DATO EXP_NUMERICA  {$$=`${$1}${$2}${$4}`; }
						   | coma TIPO_DATO EXP_NUMERICA  {$$=`${$1}${$3}` ; } ;




LLAMADA_METODO: identificador parentesis_izq LLAMADA_PARAMETRO parentesis_der punto_coma { `this.${$1}${$2}${$3}${$4}${$5}`;}
		
 
;

LLAMADA_PARAMETRO: EXP_NUMERICA LISTA_LLAMADA_PARAMETRO { $$ = `${$1}${$2}`;  }
				 | EXP_NUMERICA {$$ = `${$1}`;}
				 |{$$ = ``;};

LISTA_LLAMADA_PARAMETRO: LISTA_LLAMADA_PARAMETRO coma EXP_NUMERICA  { $$ =`${$1}${$2}${$3}`;}
				| coma EXP_NUMERICA {$$ = `,${$2}`;}								   }
;


EXP_LOGICA
	: EXP_RELACIONAL op_and EXP_RELACIONAL     {$$ = `${$1}${$2}${$3}`; }
	| EXP_RELACIONAL op_or EXP_RELACIONAL 		{$$ = `${$1}${$2}${$3}`;  }
	| op_not EXP_RELACIONAL						{$$ = `${$1}${$2}`; }	
	| EXP_RELACIONAL							{ $$ = `${$1}`; }	
;

EXP_RELACIONAL
	: EXP_NUMERICA mayor EXP_NUMERICA		{ $$ = `${$1}${$2}${$3}`; }
	| EXP_NUMERICA menor EXP_NUMERICA		{ $$ = `${$1}${$2}${$3}`; }
	| EXP_NUMERICA op_mayorigual EXP_NUMERICA { $$ = `${$1}${$2}${$3}`;  }
	| EXP_NUMERICA op_menor_igual EXP_NUMERICA	{ $$ = `${$1}${$2}${$3}`; }
	| EXP_NUMERICA op_igual_igual EXP_NUMERICA			{ $$ = `${$1}${$2}${$3}`;  }
	| EXP_NUMERICA op_not_igual EXP_NUMERICA			{ $$ = `${$1}${$2}${$3}`; }
	| EXP_NUMERICA {$$ = `${$1}`;}
;

EXP_NUMERICA
	
	: EXP_NUMERICA mas EXP_NUMERICA		{ $$=`${$1}+${$3}`;}	
	| EXP_NUMERICA MENOS EXP_NUMERICA		{  $$ =`${$1}-${$3}`; }
	| EXP_NUMERICA por EXP_NUMERICA			{  $$ = `${$1}*${$3}`; }

	| EXP_NUMERICA dividido EXP_NUMERICA	{  $$ =`${$1}/${$3}`; }
	| MENOS EXP_NUMERICA %prec UMENOS { $$ = `-${$2}`;}	
			
	| EXP_NUMERICA op_xor EXP_NUMERICA	{$$ =`${$1} ${$2} ${$3}`;}
	| parentesis_izq EXP_NUMERICA parentesis_der { $$ =`${$1} ${$2} ${$3}`;}					
	| entero					{  $$ =`${$1}`; }						
	| decimal					{ $$ =`${$1}`;}
	| CADENA					{ $$ =`${$1}`;}
	| Caracter					{ $$ =`${$1}`;}	
	| identificador				{ $$ =`${$1}`; }						
;



TIPO_DATO: tk_int { $$ =``; }
        | tk_double {  $$ =``; }
        | tk_String {  $$ =``;  }
        | tk_boolean { $$ =``;   }
        | tk_char {  $$ =``;  }
;


SENTENCIA_RETURN: tk_return EXP_NUMERICA { $$=`return ${$2}`;}
				| tk_return {$$ = `return`;}

;


SENTENCIA_BC: tk_break punto_coma { $$=`break;`;  }
			| tk_continue punto_coma { $$=`continue;`; }
			|{$$ = ``;};

