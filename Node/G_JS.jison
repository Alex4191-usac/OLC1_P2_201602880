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
"++"				%{return 'mas_mas';%}
"--"				%{return 'menos_menos';%}
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

%left 'op_or'
%left 'op_and'
%left 'op_igual_igual' 'op_not_igual'
%left 'mayor' 'menor' 'op_menor_igual' 'op_mayorigual'
%left 'mas_mas' 'menos_menos'
%left 'mas' 'MENOS'
%left 'por' 'dividido'
%left 'op_xor'
%right 'UMENOS' 'Uop_not'


%start INICIO

%%
INICIO
	: LISTA_TIPO_INSTRUCCION EOF {
	
		// cuando se haya reconocido la entrada completa retornamos la entrada traducida
		return $1;
	}
	
;

LISTA_TIPO_INSTRUCCION: LISTA_TIPO_INSTRUCCION TIPO_INSTRUCCION{ $$ = `${$1}\n${$2}`; }
					| TIPO_INSTRUCCION  { $$ = `\n${$1}`; }
					
;

TIPO_INSTRUCCION: tk_public tk_class identificador BLOQUESENTENCIAS_PADRE { $$ = `${$2} ${$3} ${$4}`;} 
				| tk_public tk_interface identificador BLOQUESENTENCIAS_PADRE_I { $$ = ``;}
				| cm_multiple {$$ =`${$1}\n`; }
				| cm_simple {$$ =`${$1}\n`; }
				| error llave_der {$$ = ``;}
				
				 
;


BLOQUESENTENCIAS_PADRE
					: llave_izq LISTA_SUB_INSTRUCCION llave_der	{ $$ = `{\n${$2}\n}`; }

;


BLOQUESENTENCIAS_PADRE_I
					: llave_izq LISTA_SUB_INSTRUCCION_I llave_der	{ $$ = ``; }

;


LISTA_SUB_INSTRUCCION_I: LISTA_SUB_INSTRUCCION_I SUB_INSTRUCCION_I { $$ = ``; }
					| SUB_INSTRUCCION_I { $$ = ``; }


;

SUB_INSTRUCCION_I:  METODO_INTERFAZ punto_coma { $$ = ``; }
					| error punto_coma  {$$ = ``;}
					
					
;

METODO_INTERFAZ : tk_public tk_void identificador parentesis_izq PARAMETROS_METODO_FUNCION parentesis_der {$$ = ``;  }
				| tk_void identificador parentesis_izq PARAMETROS_METODO_FUNCION parentesis_der {$$ = ``; }
				| tk_public TYPE identificador parentesis_izq PARAMETROS_METODO_FUNCION parentesis_der {$$ = ``;}
				| TYPE identificador  parentesis_izq PARAMETROS_METODO_FUNCION parentesis_der {$$ = ``;}
				

;




LISTA_SUB_INSTRUCCION: LISTA_SUB_INSTRUCCION SUB_INSTRUCCION { $$ = `${$1}${$2}`; }
					| SUB_INSTRUCCION { $$ = `${$1}`; }


;

SUB_INSTRUCCION: tk_public tk_void identificador parentesis_izq PARAMETROS_METODO_FUNCION parentesis_der BLOQUESENTENCIAS_HIJO {$$=`\t ${$3}${$4}${$5}${$6}${$7}`;}
				| tk_public TYPE identificador parentesis_izq PARAMETROS_METODO_FUNCION parentesis_der BLOQUESENTENCIAS_HIJO {$$=`\t function ${$3}${$4}${$5}${$6}${$7}`;}
				| tk_public tk_static tk_void tk_main parentesis_izq tk_String corchete_izq corchete_der tk_args parentesis_der BLOQUESENTENCIAS_HIJO {$$=`\t Main ${$5}${$10}${$11}`;}
				| DEFDECLARACION punto_coma {$$ =`\t${$1}${$2}\n`; }
				| DEFASIGNACION punto_coma { $$ = `\t${$1}${$2}\n`; }
				| LLAMADA_METODO punto_coma { $$ = `\t${$1}${$2}\n`; }
				| cm_multiple {$$ =`${$1}\n`; }
				| cm_simple {$$ =`${$1}\n`; }
				| error llave_der {$$ = ``;}
				
;

PARAMETROS_METODO_FUNCION: TYPE EXPRESION L_PARAMETROS_METODO_FUNCION { $$=`${$2}${$3}`; }
						| TYPE EXPRESION {$$=`${$2}`;}
						| {$$=``;}
; 

L_PARAMETROS_METODO_FUNCION: L_PARAMETROS_METODO_FUNCION coma TYPE EXPRESION  {$$=`${$1}${$2}${$4}`; }
						   | coma TYPE EXPRESION  {$$=`${$1}${$3}` ; } 
						   
;





BLOQUESENTENCIAS_HIJO 
				: llave_izq INSTRUCCIONES llave_der	{ $$ = `{\n${$2}\t}\n`; }
;


INSTRUCCIONES
	: INSTRUCCIONES INSTRUCCION 	{ $$ = `${$1}${$2}`; }
	| INSTRUCCION					{ $$ = `${$1}`; }
;

INSTRUCCION
	: DEFDECLARACION punto_coma		{ $$ = `\t\t${$1}${$2}\n`; }
	| DEFASIGNACION punto_coma { $$ = `\t\t${$1}${$2}\n`; }
	| LLAMADA_METODO punto_coma     { $$ = `\t\t${$1};\n`; }
    | DEFIF						{ $$ = `\t\t${$1}\n`; }
    | DEFWHILE					{ $$ = `\t\t${$1}\n`; }
	| DEFFOR					{ $$ = `\t\t${$1}\n`; }
	| DEFDO tk_while parentesis_izq EXPRESION parentesis_der punto_coma {$$ = `\t\t${$1}${$2}${$3}${$4}${$5};\n`;}
    | DEFPRINT punto_coma 			{ $$ = `\t\t${$1};\n`; }
	| SENTENCIA_RETURN punto_coma { $$ = `\t\t${$1};\n`; }
	| SENTENCIA_BC punto_coma  { $$ = `\t\t${$1};\n`; }
	| cm_multiple {$$ =`${$1}\n`; }
	| cm_simple {$$ =`${$1}\n`; }
	| error punto_coma  {$$ = ``;}
	
;


DEFDECLARACION:   TYPE LISTA_VARIABLES  {$$ = `var ${$2}`;}
				 			
;

DEFASIGNACION:   identificador igual EXPRESION { $$ = `${$1}${$2}${$3}`; }
				 | EXPRESION {$$=`${$1}`;}
				

;

LISTA_VARIABLES:  LISTA_VARIABLES coma identificador   {$$ =`${$1}${$2}${$3}`;}
				| LISTA_VARIABLES coma identificador igual EXPRESION {$$ = `${$1}${$2}${$3}${$4}${$5}`;}
				| identificador igual EXPRESION {$$ =`${$1}${$2}${$3}`;}
				| identificador {$$ =`${$1}`;}
	
  		
;
LLAMADA_METODO
		: identificador parentesis_izq LLAMADA_PARAMETRO parentesis_der  {$$= `${$1}${$2}${$3}${$4}`;}
		
;

LLAMADA_PARAMETRO: EXPRESION LISTA_LLAMADA_PARAMETRO { $$ = `${$1}${$2}`;  }
				 | EXPRESION {$$ = `${$1}`;}
				 |{$$ = ``;}
;

LISTA_LLAMADA_PARAMETRO: LISTA_LLAMADA_PARAMETRO coma EXPRESION  { $$ =`${$1}${$2}${$3}`;}
				| coma EXPRESION {$$ = `,${$2}`;}								  
;

DEFIF
    : tk_if parentesis_izq EXPRESION parentesis_der BLOQUESENTENCIAS							{ $$ = `${$1}${$2}${$3}${$4}${$5}`; }
    | tk_if parentesis_izq EXPRESION parentesis_der BLOQUESENTENCIAS tk_else BLOQUESENTENCIAS	{ $$ = `${$1}${$2}${$3}${$4}${$5}${$6}${$7}`; }
    | tk_if parentesis_izq EXPRESION parentesis_der BLOQUESENTENCIAS tk_else DEFIF				{ $$ = `${$1}${$2}${$3}${$4}${$5}${$6}${$7}`; }
;

DEFPRINT
    : tk_System punto tk_out punto tk_println parentesis_izq EXPRESION parentesis_der {$$ = `console.log(${$7})`;}
	| tk_System punto tk_out punto tk_print parentesis_izq EXPRESION parentesis_der{$$ = `console.log(${$7})`;}
;

DEFWHILE
    
    : tk_while parentesis_izq EXPRESION parentesis_der BLOQUESENTENCIAS { $$ = `while ( ${$3} ) \n${$5}`; }
    
;

DEFFOR

	: tk_for parentesis_izq DEFDECLARACION punto_coma EXPRESION punto_coma  DEFASIGNACION parentesis_der BLOQUESENTENCIAS { $$ = `for ( ${$3};${$5};${$7} )${$9} `; }

;

DEFDO 

	: tk_do BLOQUESENTENCIAS { $$ = `do${$2}`; }
;


BLOQUESENTENCIAS
    : llave_izq INSTRUCCIONES llave_der	{ $$ = `{\n${$2}\t\t}`; }
;



EXPRESION
	: EXPRESION mas EXPRESION               { $$ = `${$1} + ${$3}`; }
    | EXPRESION MENOS EXPRESION             { $$ = `${$1} - ${$3}`; }
    | EXPRESION por EXPRESION               { $$ = `${$1} * ${$3}`; }
    | EXPRESION dividido EXPRESION               { $$ = `${$1} / ${$3}`; }
	| EXPRESION op_xor EXPRESION               { $$ = `${$1} ^ ${$3}`; }
    | MENOS EXPRESION %prec UMENOS	        { $$ = `- ${$2}`; }
    | entero                                { $$ = `${$1}`; }
    | decimal                               { $$ = `${$1}`; }
    | Caracter                              { $$ = `${$1}`; }
    | CADENA                                { $$ = `${$1}`; }
    | identificador                         { $$ = $1 }
    | EXPRESION op_igual_igual EXPRESION        { $$ = `${$1} == ${$3}`; }
    | EXPRESION op_not_igual EXPRESION         { $$ = `${$1} != ${$3}`; }
    | EXPRESION menor EXPRESION          { $$ = `${$1} < ${$3}`; }
    | EXPRESION mayor EXPRESION          { $$ = `${$1} > ${$3}`; }
    | EXPRESION op_menor_igual EXPRESION       { $$ = `${$1} <= ${$3}`; }
    | EXPRESION op_mayorigual EXPRESION       { $$ = `${$1} >= ${$3}`; }
    | EXPRESION op_and EXPRESION               { $$ = `${$1} && ${$3}`; }
    | EXPRESION op_or EXPRESION                { $$ = `${$1} || ${$3}`; }
	| EXPRESION mas_mas                     {$$ = `${$1}++`; }
    | EXPRESION menos_menos                 {$$ = `${$1}--`; }
    | op_not EXPRESION %prec Uop_not        { $$ = `! ${$2}`; }
    | parentesis_izq EXPRESION parentesis_der{ $$ = `( ${$2} )`; }
;




TYPE: 
		tk_int { $$ =``; }
        | tk_double {  $$ =``; }
        | tk_String {  $$ =``;  }
        | tk_boolean { $$ =``;   }
        | tk_char {  $$ =``;  }
;

SENTENCIA_RETURN: tk_return EXPRESION { $$=`return ${$2}`;}
				| tk_return {$$ = `return`;}

;

SENTENCIA_BC: tk_break{ $$=`break`;  }
			| tk_continue { $$=`continue`; }
			
;













