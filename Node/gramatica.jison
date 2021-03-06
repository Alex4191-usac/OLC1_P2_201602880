%{
	const Nodo = require('./AstTree');
	const Token = require('./Token');
	let Token_List = [];
	let Error_Array = [];
%}
/*--------------------------------------------analisis lexico--------------------------*/
%lex
%options case-insensitive
%%


[/][*][^*]*[*]+([^/*][^*]*[*]+)*[/]			// comentario multiple líneas		
"//".*										// comentario simple línea
/*----------------------------------------------palabras reservadas--------------------*/
"public"            %{	Token_List.push(new Token(yylloc.first_line,yylloc.first_column,"public","tk_public",1));
						return 'tk_public';%}
"static"            %{	Token_List.push(new Token(yylloc.first_line,yylloc.first_column,"static","tk_static",2));
						return 'tk_static';%}
"class"             %{	Token_List.push(new Token(yylloc.first_line,yylloc.first_column,"class","tk_class",3));
						return 'tk_class';%}
"interface"         %{	Token_List.push(new Token(yylloc.first_line,yylloc.first_column,"interface","tk_interface",4));
						return 'tk_interface';%}
"void"              %{	Token_List.push(new Token(yylloc.first_line,yylloc.first_column,"void","tk_void",5));
						return 'tk_void';%}
"main"              %{Token_List.push(new Token(yylloc.first_line,yylloc.first_column,"main","tk_main",6));
						return 'tk_main';%}
"args"              %{Token_List.push(new Token(yylloc.first_line,yylloc.first_column,"args","tk_args",7));
						return 'tk_args';%}
"System"			%{Token_List.push(new Token(yylloc.first_line,yylloc.first_column,"System","tk_System",8));
						return 'tk_System';%}
"out"				%{Token_List.push(new Token(yylloc.first_line,yylloc.first_column,"out","tk_out",9));
						return 'tk_out';%}
"print"				%{Token_List.push(new Token(yylloc.first_line,yylloc.first_column,"print","tk_print",10));
						return 'tk_print';%}
"println"			%{Token_List.push(new Token(yylloc.first_line,yylloc.first_column,"println","tk_println",11));
						return 'tk_println';%}
"int"               %{Token_List.push(new Token(yylloc.first_line,yylloc.first_column,"int","tk_int",12));
						return 'tk_int';%}
"double"            %{Token_List.push(new Token(yylloc.first_line,yylloc.first_column,"double","tk_double",13));
						return 'tk_double';%}
"char"              %{Token_List.push(new Token(yylloc.first_line,yylloc.first_column,"char","tk_char",14));
						return 'tk_char';%}
"boolean"           %{Token_List.push(new Token(yylloc.first_line,yylloc.first_column,"boolean","tk_boolean",15));
						return 'tk_boolean';%}
"String"            %{Token_List.push(new Token(yylloc.first_line,yylloc.first_column,"String","tk_String",16));
						return 'tk_String';%}
"for"               %{Token_List.push(new Token(yylloc.first_line,yylloc.first_column,"for","tk_for",17));
						return 'tk_for';%}
"while"             %{Token_List.push(new Token(yylloc.first_line,yylloc.first_column,"while","tk_while",18));
						return 'tk_while';%}
"do"                %{Token_List.push(new Token(yylloc.first_line,yylloc.first_column,"do","tk_do",19));
						return 'tk_do';%}
"break"             %{Token_List.push(new Token(yylloc.first_line,yylloc.first_column,"break","tk_break",20));
						return 'tk_break';%}
"return"            %{Token_List.push(new Token(yylloc.first_line,yylloc.first_column,"return","tk_return",21));
						return 'tk_return';%}
"continue"          %{Token_List.push(new Token(yylloc.first_line,yylloc.first_column,"continue","tk_continue",22));
						return 'tk_continue';%}
"if"                %{Token_List.push(new Token(yylloc.first_line,yylloc.first_column,"if","tk_if",23));
						return 'tk_if';%}
"else"              %{Token_List.push(new Token(yylloc.first_line,yylloc.first_column,"else","tk_else",24));
						return 'tk_else';%}

/*------------------------------------------------------------------------------------------*/
";"                 %{Token_List.push(new Token(yylloc.first_line,yylloc.first_column,";","",25));
						return 'punto_coma'; %}
"("                 %{Token_List.push(new Token(yylloc.first_line,yylloc.first_column,"(","parentesis_izq",26));
						return 'parentesis_izq'; %}
")"                 %{Token_List.push(new Token(yylloc.first_line,yylloc.first_column,")","parentesis_der",27));
						return 'parentesis_der'; %}
"["                 %{Token_List.push(new Token(yylloc.first_line,yylloc.first_column,"[","conrchete_izq",28));
						return 'corchete_izq'; %}
"]"                 %{Token_List.push(new Token(yylloc.first_line,yylloc.first_column,"]","corchete_der",29));
						return 'corchete_der'; %}
"{"                 %{Token_List.push(new Token(yylloc.first_line,yylloc.first_column,"{","llave_izq",30));
						return 'llave_izq'%}
"}"                 %{Token_List.push(new Token(yylloc.first_line,yylloc.first_column,"}","llave_der",31));
						return 'llave_der'%}
","                 %{Token_List.push(new Token(yylloc.first_line,yylloc.first_column,",","coma",32));
						return 'coma'; %}
"."                 %{Token_List.push(new Token(yylloc.first_line,yylloc.first_column,".","punto",33));
						return 'punto'; %}
">="                %{Token_List.push(new Token(yylloc.first_line,yylloc.first_column,">=","op_mayorigual",34));
						return 'op_mayorigual';%}
"<="                %{Token_List.push(new Token(yylloc.first_line,yylloc.first_column,"<=","op_menor_igual",35));
						return 'op_menor_igual';%}
"&&"                %{Token_List.push(new Token(yylloc.first_line,yylloc.first_column,"&&","op_and",36));
						return 'op_and';%}
"||"                %{Token_List.push(new Token(yylloc.first_line,yylloc.first_column,"||","op_or",37));
						return 'op_or';%}
"!="                %{Token_List.push(new Token(yylloc.first_line,yylloc.first_column,"!=","op_not_igual",38));
						return 'op_not_igual';%}
"=="                %{Token_List.push(new Token(yylloc.first_line,yylloc.first_column,"==","op_igual_igual",39));
						return 'op_igual_igual';%}
"++"				%{Token_List.push(new Token(yylloc.first_line,yylloc.first_column,"++","mas_mas",54));
					return 'mas_mas';%}
"--"				%{Token_List.push(new Token(yylloc.first_line,yylloc.first_column,"--","menos_menos",54));
					return 'menos_menos';%}
"+"					%{Token_List.push(new Token(yylloc.first_line,yylloc.first_column,"+","mas",40));
						return 'mas';%}
"-"					%{Token_List.push(new Token(yylloc.first_line,yylloc.first_column,"-","menos",41));
						return 'MENOS';%}
"*"					%{Token_List.push(new Token(yylloc.first_line,yylloc.first_column,"*","por",42));
						return 'por';%}
"/"					%{Token_List.push(new Token(yylloc.first_line,yylloc.first_column,"/","divido",43));
						return 'dividido';%}
"^"                 %{Token_List.push(new Token(yylloc.first_line,yylloc.first_column,"^","op_xor",44));
						return 'op_xor';%}
">"                 %{Token_List.push(new Token(yylloc.first_line,yylloc.first_column,">","mayor",45));
						return 'mayor';%}
"<"                 %{Token_List.push(new Token(yylloc.first_line,yylloc.first_column,"<","menor",46));
						return 'menor';%}
"="                 %{Token_List.push(new Token(yylloc.first_line,yylloc.first_column,"=","igual",47));
						return 'igual'; %}
"!"                 %{Token_List.push(new Token(yylloc.first_line,yylloc.first_column,"!","not",48));
						return 'op_not';%}
/* --------------------------especiales--------------------------------------*/
[ \r\t\f]+            %{ /*ignore */%}
\n                  %{/*it will count */%}
\s+                                 // se ignoran espacios en blanco
	

/*---------------------- EXPRESIONES REGULARES-------------------------*/

/*---------------------- EXPRESIONES REGULARES-------------------------*/

\"[^\"]*\"              %{yytext = yytext.substr(1,yyleng-2); 
						  Token_List.push(new Token(yylloc.first_line,yylloc.first_column,yytext,"Cadena",49));
						return 'CADENA'; %}
"'"[^']"'"				%{yytext = yytext.substr(1,yyleng-2); 
						Token_List.push(new Token(yylloc.first_line,yylloc.first_column,yytext,"caracter",50));
						return 'Caracter'; %}
[0-9]+("."[0-9]+)?\b    %{Token_List.push(new Token(yylloc.first_line,yylloc.first_column,yytext,"decimal",51));
						return 'decimal'; %}
[0-9]+\b                %{Token_List.push(new Token(yylloc.first_line,yylloc.first_column,yytext,"entero",52));
						return 'entero'; %}
([a-zA-Z])[a-zA-Z0-9_]* %{Token_List.push(new Token(yylloc.first_line,yylloc.first_column,yytext,"identificador",53));
						return 'identificador'; %}

<<EOF>>                 %{return 'EOF'; %}

.                       { console.error('Este es un error léxico: ' + yytext + ', en la linea: ' + yylloc.first_line + ', en la columna: ' + yylloc.first_column);
						  Error_Array.push('Este es un error léxico: ' + yytext + ', en la linea: ' + yylloc.first_line + ', en la columna: ' + yylloc.first_column);  }

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


INICIO: LISTA_TIPO_INSTRUCCION EOF  { $$=new Nodo("INICIO");
							$$.AgregarHijo($1);
							let tempErrores =[];
							let tempTokens =[]
							tempErrores = Error_Array;
							tempTokens = Token_List;
							Error_Array = [];
							Token_List = []
							return {ast:$$ , lista_error: tempErrores, lista_token: tempTokens};  };




LISTA_TIPO_INSTRUCCION:  LISTA_TIPO_INSTRUCCION TIPO_INSTRUCCION { $$ = new Nodo("LISTA_TIPO_INSTRUCCION","");
																	$$.AgregarHijo($1);
																		$$.AgregarHijo($2); }
					| TIPO_INSTRUCCION  { $$ = new Nodo("LISTA_TIPO_INSTRUCCION","");
											   $$.AgregarHijo($1);
												 }
;



TIPO_INSTRUCCION: tk_public tk_class identificador BLOQUESENTENCIAS_PADRE { $$ = new Nodo("TIPO_INSTRUCCION","");
																							  $$.AgregarHijo(new Nodo("public","tk_public"));
																							  $$.AgregarHijo(new Nodo("class","tk_class"));
																							  $$.AgregarHijo(new Nodo($3,"Id"));
																							  $$.AgregarHijo($4);} 
				| tk_public tk_interface identificador BLOQUESENTENCIAS_PADRE_I {$$ = new Nodo("TIPO_INSTRUCCION","");
																			$$.AgregarHijo(new Nodo("public","tk_public"));
																			$$.AgregarHijo(new Nodo("interface","tk_interface"));
																			$$.AgregarHijo(new Nodo($3,"Id"));
																			$$.AgregarHijo($4);}
				| error llave_der {$$ = new Nodo("error","error");
				Error_Array.push('Este es un error Sintactico: ' + yytext + ', en la linea: ' + this._$.first_line + ', en la columna: ' +this._$.first_column); }
;


BLOQUESENTENCIAS_PADRE
					: llave_izq LISTA_SUB_INSTRUCCION llave_der	{ $$ = new Nodo("BLOQUESENTENCIAS_PADRE","");
																	$$.AgregarHijo(new Nodo("{","llave_izq"));
																	$$.AgregarHijo($2);
																	$$.AgregarHijo(new Nodo("}","llave_der")); }

;

BLOQUESENTENCIAS_PADRE_I
					: llave_izq LISTA_SUB_INSTRUCCION_I llave_der	{ $$ = new Nodo("BLOQUE_S_INTERFAZ","");
																	$$.AgregarHijo(new Nodo("{","llave_izq"));
																	$$.AgregarHijo($2);
																	$$.AgregarHijo(new Nodo("}","llave_der")); }

;

LISTA_SUB_INSTRUCCION_I: LISTA_SUB_INSTRUCCION_I SUB_INSTRUCCION_I {$$ = new Nodo("LISTA_SUB_INSTRUCCION_I","");
																$$.AgregarHijo($1);
																$$.AgregarHijo($2); }
					| SUB_INSTRUCCION_I { $$ = new Nodo("LISTA_SUB_INSTRUCCION","");
									  $$.AgregarHijo($1);}


;

SUB_INSTRUCCION_I:  METODO_INTERFAZ punto_coma { $$ = new Nodo("SUB_INSTRUCCION_I","");
												$$.AgregarHijo($1);
												$$.AgregarHijo(new Nodo(";","punto_coma")); }
					| error punto_coma  {$$ = new Nodo("error","error");
					Error_Array.push('Este es un error Sintactico: ' + yytext + ', en la linea: ' + this._$.first_line + ', en la columna: ' +this._$.first_column); }
					
					
;

METODO_INTERFAZ : tk_public tk_void identificador parentesis_izq PARAMETROS_METODO_FUNCION parentesis_der {$$ = new Nodo("METODO_INTERFAZ",""); 
																										$$.AgregarHijo(new Nodo("public","tk_public"));
																										$$.AgregarHijo(new Nodo("void","tk_void"));	
																										$$.AgregarHijo(new Nodo($3,"Id"));	
																										$$.AgregarHijo(new Nodo("(","par_izq"));
																										$$.AgregarHijo($5);	
																										$$.AgregarHijo(new Nodo(")","par_der"));
																										 }
				| tk_void identificador parentesis_izq PARAMETROS_METODO_FUNCION parentesis_der { $$ = new Nodo("METODO_INTERFAZ",""); 
																										$$.AgregarHijo(new Nodo("void","tk_void"));	
																										$$.AgregarHijo(new Nodo($2,"Id"));	
																										$$.AgregarHijo(new Nodo("(","par_izq"));
																										$$.AgregarHijo($4);	
																										$$.AgregarHijo(new Nodo(")","par_der")); }
				| tk_public TYPE identificador parentesis_izq PARAMETROS_METODO_FUNCION parentesis_der {$$ = new Nodo("METODO_INTERFAZ",""); 
																										$$.AgregarHijo(new Nodo("public","tk_public"));
																										$$.AgregarHijo($2);	
																										$$.AgregarHijo(new Nodo($3,"Id"));	
																										$$.AgregarHijo(new Nodo("(","par_izq"));
																										$$.AgregarHijo($5);	
																										$$.AgregarHijo(new Nodo(")","par_der"));}
				| TYPE identificador  parentesis_izq PARAMETROS_METODO_FUNCION parentesis_der {$$ = new Nodo("METODO_INTERFAZ",""); 
																								$$.AgregarHijo($1);
																								$$.AgregarHijo(new Nodo($2,"Id"));	
																								
																								$$.AgregarHijo(new Nodo("(","par_izq"));
																								$$.AgregarHijo($4);	
																								$$.AgregarHijo(new Nodo(")","par_der"));}
				
;




LISTA_SUB_INSTRUCCION: LISTA_SUB_INSTRUCCION SUB_INSTRUCCION { $$ = new Nodo("LISTA_SUB_INSTRUCCION","");
																$$.AgregarHijo($1);
																$$.AgregarHijo($2); }
					| SUB_INSTRUCCION {$$ = new Nodo("LISTA_SUB_INSTRUCCION","");
									  $$.AgregarHijo($1); }


;

SUB_INSTRUCCION: tk_public tk_void identificador parentesis_izq PARAMETROS_METODO_FUNCION parentesis_der BLOQUESENTENCIAS_HIJO {$$ = new Nodo("SUB_INSTRUCCION","");
																																$$.AgregarHijo(new Nodo("public","tk_public"));
																																$$.AgregarHijo(new Nodo("void","tk_void"));	
																																$$.AgregarHijo(new Nodo($3,"Id"));	
																																$$.AgregarHijo(new Nodo("(","par_izq"));
																																$$.AgregarHijo($5);	
																																$$.AgregarHijo(new Nodo(")","par_der"));
																																$$.AgregarHijo($7);}
				| tk_public TYPE identificador parentesis_izq PARAMETROS_METODO_FUNCION parentesis_der BLOQUESENTENCIAS_HIJO {$$ = new Nodo("SUB_INSTRUCCION","");
																															$$.AgregarHijo(new Nodo("public","tk_public"));
																															$$.AgregarHijo($2);	
																															$$.AgregarHijo(new Nodo($3,"Id"));	
																															$$.AgregarHijo(new Nodo("(","par_izq"));
																															$$.AgregarHijo($5);	
																															$$.AgregarHijo(new Nodo(")","par_der"));
																															$$.AgregarHijo($7);}
				| tk_public tk_static tk_void tk_main parentesis_izq tk_String corchete_izq corchete_der tk_args parentesis_der BLOQUESENTENCIAS_HIJO {$$ = new Nodo("SUB_INSTRUCCION","");
																																					$$.AgregarHijo(new Nodo("public","tk_public"));
																																					$$.AgregarHijo(new Nodo("static","tk_static"));
																																					$$.AgregarHijo(new Nodo("void","tk_void"));	
																																					$$.AgregarHijo(new Nodo("main","tk_main"));
																																					$$.AgregarHijo(new Nodo("(","par_izq"));
																																					$$.AgregarHijo(new Nodo("String","tk_string"));
																																					$$.AgregarHijo(new Nodo("[","corchete_izq"));
																																					$$.AgregarHijo(new Nodo("]","corchete_der"));
																																					$$.AgregarHijo(new Nodo("args","tk_args"));
																																					$$.AgregarHijo(new Nodo(")","par_der"));
																																					$$.AgregarHijo($11);}
				| DEFDECLARACION punto_coma {$$ = new Nodo("SUB_INSTRUCCION","");
											 $$.AgregarHijo($1);
											 $$.AgregarHijo(new Nodo(";","punto_coma"));}
				| DEFASIGNACION punto_coma		{  $$ = new Nodo("SUB_INSTRUCCION","");
								  	   $$.AgregarHijo($1);
								  	   $$.AgregarHijo(new Nodo(";","punto_coma"));}
				| LLAMADA_METODO punto_coma    {  $$ = new Nodo("SUB_INSTRUCCION","");
								  	   $$.AgregarHijo($1);
								  	   $$.AgregarHijo(new Nodo(";","punto_coma"));}
				| error llave_der{$$ = new Nodo("error","error");
				Error_Array.push('Este es un error Sintactico: ' + yytext + ', en la linea: ' + this._$.first_line + ', en la columna: ' +this._$.first_column); }
				
;

PARAMETROS_METODO_FUNCION: TYPE EXPRESION L_PARAMETROS_METODO_FUNCION {$$ = new Nodo("PARAMETROS_METODO_FUNCION","");
											      						  $$.AgregarHijo($1);
												  						  $$.AgregarHijo($2);
																		  $$.AgregarHijo($3);  }
						| TYPE EXPRESION {$$ = new Nodo("PARAMETROS_METODO_FUNCION");
											      $$.AgregarHijo($1);
												  $$.AgregarHijo($2);}
						| 
; 


L_PARAMETROS_METODO_FUNCION: L_PARAMETROS_METODO_FUNCION coma TYPE EXPRESION  {$$ = new Nodo("L_PARAMETROS_METODO_FUNCION","");
																						
																						$$.AgregarHijo($1);
																						$$.AgregarHijo(new Nodo(",","coma"));
																						$$.AgregarHijo($3);
																						$$.AgregarHijo($4);  }
						   | coma TYPE EXPRESION  {$$ = new Nodo("L_PARAMETROS_METODO_FUNCION","");
						   							$$.AgregarHijo(new Nodo(",","coma"));
													$$.AgregarHijo($2);
													$$.AgregarHijo($3);} 
						   
;






BLOQUESENTENCIAS_HIJO 
				: llave_izq INSTRUCCIONES llave_der	{$$ = new Nodo("BLOQUESENTENCIAS_HIJO","");
													$$.AgregarHijo(new Nodo("{","llave_izq"));
													$$.AgregarHijo($2);
													$$.AgregarHijo(new Nodo("}","llave_der")); }
;






INSTRUCCIONES
	:   INSTRUCCIONES INSTRUCCION	{  $$ = new Nodo("INSTRUCCIONES","");
										$$.AgregarHijo($1);
									    $$.AgregarHijo($2); }
	| INSTRUCCION					{  $$ = new Nodo("INSTRUCCIONES","");
										$$.AgregarHijo($1);
									 }
;

INSTRUCCION
	: DEFDECLARACION punto_coma		{  $$ = new Nodo ("INSTRUCCION","");
								  	   $$.AgregarHijo($1);
								  	   $$.AgregarHijo(new Nodo(";","punto_coma"));}
	| DEFASIGNACION punto_coma		{  $$ = new Nodo ("INSTRUCCION");
								  	   $$.AgregarHijo($1);
								  	   $$.AgregarHijo(new Nodo(";","punto_coma"));}
	| LLAMADA_METODO punto_coma     {  $$ = new Nodo ("INSTRUCCION","");
								  	   $$.AgregarHijo($1);
								       $$.AgregarHijo(new Nodo(";","punto_coma"));}
    | DEFIF						{ $$ = new Nodo ("INSTRUCCION","");
								$$.AgregarHijo($1); }
    | DEFWHILE					{ $$ = new Nodo ("INSTRUCCION","");
								$$.AgregarHijo($1); }
	| DEFFOR					{$$ = new Nodo ("INSTRUCCION","");
								$$.AgregarHijo($1); }
	| DEFDO tk_while parentesis_izq EXPRESION parentesis_der punto_coma {$$ = new Nodo ("INSTRUCCION","");
								 										 $$.AgregarHijo($1);
								  										 $$.AgregarHijo(new Nodo("while","tk_while"));
																		 $$.AgregarHijo(new Nodo("(","parentesis_izq"));
																		 $$.AgregarHijo($4);
																		 $$.AgregarHijo(new Nodo("(","parentesis_izq"));
																		 $$.AgregarHijo(new Nodo(";","punto_coma"));}
    | DEFPRINT punto_coma 		{ $$ = new Nodo ("INSTRUCCION","");
								  $$.AgregarHijo($1);
								  $$.AgregarHijo(new Nodo(";","punto_coma")); }
	| SENTENCIA_RETURN punto_coma { $$ = new Nodo ("INSTRUCCION","");
								  	$$.AgregarHijo($1);
								  	$$.AgregarHijo(new Nodo(";","punto_coma")); }
	| SENTENCIA_BC punto_coma  { $$ = new Nodo ("INSTRUCCION","");
								  $$.AgregarHijo($1);
								  $$.AgregarHijo(new Nodo(";","punto_coma")); }
	| error punto_coma  {$$ = new Nodo("error","error");
	Error_Array.push('Este es un error Sintactico: ' + yytext + ', en la linea: ' + this._$.first_line + ', en la columna: ' +this._$.first_column); }
	
	
;



DEFDECLARACION:  TYPE LISTA_VARIABLES {$$= new Nodo ("DEFDECLARACION","");
										$$.AgregarHijo($1);
										$$.AgregarHijo($2);
										}

;

DEFASIGNACION:  identificador igual EXPRESION {$$= new Nodo ("DEFASIGNACION","");
												 $$.AgregarHijo(new Nodo($1,"Id"));
												 $$.AgregarHijo(new Nodo("=","igual"));
												 $$.AgregarHijo($3);}
				| EXPRESION {$$= new Nodo ("DEFASIGNACION","");
							$$.AgregarHijo($1);}
;



/**/
LISTA_VARIABLES:  LISTA_VARIABLES coma identificador   {$$ = new Nodo("LISTA_VARIABLES","");
													  $$.AgregarHijo($1);
													  $$.AgregarHijo(new Nodo(",","coma"));
													  $$.AgregarHijo(new Nodo($3,"Id"));
													  }
				| LISTA_VARIABLES coma identificador igual EXPRESION {$$ = new Nodo("LISTA_VARIABLES","");
													  $$.AgregarHijo($1);
													  $$.AgregarHijo(new Nodo(",","coma"));
													  $$.AgregarHijo(new Nodo($3,"Id"));
													  $$.AgregarHijo(new Nodo("=","igual"));
													  $$.AgregarHijo($5);
													  }
				| identificador igual EXPRESION {$$ = new Nodo("LISTA_VARIABLES","");
								$$.AgregarHijo(new Nodo($1,"Id"));
								$$.AgregarHijo(new Nodo("=","igual"));
								$$.AgregarHijo($3);}
				| identificador {$$ = new Nodo("LISTA_VARIABLES");
								$$.AgregarHijo(new Nodo($1,"Id"));}
	
  		
;


LLAMADA_METODO: identificador parentesis_izq LLAMADA_PARAMETRO parentesis_der  { 
		$$ = new Nodo("LLAMADA_METODO","");
		$$.AgregarHijo(new Nodo($1,"Id"));
		$$.AgregarHijo(new Nodo("(","par_izq"));
		$$.AgregarHijo($3);
		$$.AgregarHijo(new Nodo(")","par_der"));}
		
	
 
;



LLAMADA_PARAMETRO: EXPRESION LISTA_LLAMADA_PARAMETRO { $$= new Nodo("LLAMADA_PARAMETRO","");
				 				 						  $$.AgregarHijo($1);
															$$.AgregarHijo($2);  }
				 | EXPRESION {$$= new Nodo("LLAMADA_PARAMETRO","");
				 				 $$.AgregarHijo($1);}
				 |
				 
;


LISTA_LLAMADA_PARAMETRO: LISTA_LLAMADA_PARAMETRO coma EXPRESION  { $$ = new Nodo("LISTA_LLAMADA_PARAMETRO","");
																	  $$.AgregarHijo($1);
																	  $$.AgregarHijo(new Nodo(",","comma"))
																	  $$.AgregarHijo($3);}
				| coma EXPRESION {$$ = new Nodo("LISTA_LLAMADA_PARAMETRO","");
									 $$.AgregarHijo(new Nodo(",","comma"));
									 $$.AgregarHijo($2);}								   
;




DEFIF
    : tk_if parentesis_izq EXPRESION parentesis_der BLOQUESENTENCIAS	{ 	$$ = new Nodo("DEFIF","");
																			$$.AgregarHijo(new Nodo("if","tk_if"));
																			$$.AgregarHijo(new Nodo("(","par_izq"));
																			$$.AgregarHijo($3);
																			$$.AgregarHijo(new Nodo(")","par_der"));
																			$$.AgregarHijo($5);}
    | tk_if parentesis_izq EXPRESION parentesis_der BLOQUESENTENCIAS tk_else BLOQUESENTENCIAS	{ 	$$ = new Nodo("DEFIF","");
																			$$.AgregarHijo(new Nodo("if","tk_if"));
																			$$.AgregarHijo(new Nodo("(","par_izq"));
																			$$.AgregarHijo($3);
																			$$.AgregarHijo(new Nodo(")","par_der"));
																			$$.AgregarHijo($5);
																			$$.AgregarHijo(new Nodo("else","tk_else")); 
																			$$.AgregarHijo($7);}
    | tk_if parentesis_izq EXPRESION parentesis_der BLOQUESENTENCIAS tk_else DEFIF	{$$ = new Nodo("DEFIF","");
																			$$.AgregarHijo(new Nodo("if","tk_if"));
																			$$.AgregarHijo(new Nodo("(","par_izq"));
																			$$.AgregarHijo($3);
																			$$.AgregarHijo(new Nodo(")","par_der"));
																			$$.AgregarHijo($5);
																			$$.AgregarHijo(new Nodo("else","tk_else")); 
																			$$.AgregarHijo($7);
																			
																			}
;

DEFPRINT
    : tk_System punto tk_out punto tk_println parentesis_izq EXPRESION parentesis_der {$$ = new Nodo("DEFPRINT","");
																						$$.AgregarHijo(new Nodo("System","tk_System"));
																						$$.AgregarHijo(new Nodo(".","tk_dot"));
																						$$.AgregarHijo(new Nodo("out","tk_out"));
																						$$.AgregarHijo(new Nodo(".","tk_dot"));
																						$$.AgregarHijo(new Nodo("println","tk_print"));
																						$$.AgregarHijo(new Nodo("(","par_izq"));
																						$$.AgregarHijo($7);
																						$$.AgregarHijo(new Nodo(")","par_der"));}
	| tk_System punto tk_out punto tk_print parentesis_izq EXPRESION parentesis_der{$$ = new Nodo("DEFPRINT","");
																						$$.AgregarHijo(new Nodo("System","tk_System"));
																						$$.AgregarHijo(new Nodo(".","tk_dot"));
																						$$.AgregarHijo(new Nodo("out","tk_out"));
																						$$.AgregarHijo(new Nodo(".","tk_dot"));
																						$$.AgregarHijo(new Nodo("print","tk_print"));
																						$$.AgregarHijo(new Nodo("(","par_izq"));
																						$$.AgregarHijo($7);
																						$$.AgregarHijo(new Nodo(")","par_der"));}
;

DEFWHILE
    
    : tk_while parentesis_izq EXPRESION parentesis_der BLOQUESENTENCIAS { $$ = new Nodo("DEFWHILE","");
																			$$.AgregarHijo(new Nodo("while","tk_while"));
																			$$.AgregarHijo(new Nodo("(","par_izq"));
																			$$.AgregarHijo($3);
																			$$.AgregarHijo(new Nodo(")","par_der"));
																			$$.AgregarHijo($5); }
    
;

DEFFOR : 
	 tk_for parentesis_izq DEFDECLARACION punto_coma EXPRESION punto_coma  DEFASIGNACION parentesis_der BLOQUESENTENCIAS { $$ = new Nodo("DEFFOR","");
																															$$.AgregarHijo(new Nodo("for","tk_for"));
																															$$.AgregarHijo(new Nodo("(","par_izq"));
																															$$.AgregarHijo($3);
																															$$.AgregarHijo(new Nodo(";","punto_coma"));
																															$$.AgregarHijo($5);
																															$$.AgregarHijo(new Nodo(";","punto_coma"));
																															$$.AgregarHijo($7);
																															$$.AgregarHijo(new Nodo(")","par_der"));
																															$$.AgregarHijo($9); }

;




DEFDO : 
		tk_do BLOQUESENTENCIAS { $$= new Nodo("DEFDO","");
								$$.AgregarHijo(new Nodo("do","tk_do"));
								$$.AgregarHijo($2); }
;

BLOQUESENTENCIAS
    : llave_izq INSTRUCCIONES llave_der	{ $$ = new Nodo("BLOQUESENTENCIAS","");
	
											$$.AgregarHijo(new Nodo("{","llave_izq"));
											$$.AgregarHijo($2);
											$$.AgregarHijo(new Nodo("}","llave_der")); }
;







EXPRESION
	: EXPRESION mas EXPRESION               { $$ = new Nodo ("EXPRESION",""); 
											$$.AgregarHijo($1);
											$$.AgregarHijo(new Nodo("+","mas"));
											$$.AgregarHijo($3);}
    | EXPRESION MENOS EXPRESION             { $$ = new Nodo ("EXPRESION",""); 
											$$.AgregarHijo($1);
											$$.AgregarHijo(new Nodo("-","menos"));
											$$.AgregarHijo($3); }
    | EXPRESION por EXPRESION               {  $$ = new Nodo ("EXPRESION",""); 
											$$.AgregarHijo($1);
											$$.AgregarHijo(new Nodo("*","por"));
											$$.AgregarHijo($3); }
    | EXPRESION dividido EXPRESION               { $$ = new Nodo ("EXPRESION",""); 
											$$.AgregarHijo($1);
											$$.AgregarHijo(new Nodo("/","dividido"));
											$$.AgregarHijo($3); }
	| EXPRESION op_xor EXPRESION               { $$ = new Nodo ("EXPRESION",""); 
											$$.AgregarHijo($1);
											$$.AgregarHijo(new Nodo("^","op_xor"));
											$$.AgregarHijo($3); }
    | MENOS EXPRESION %prec UMENOS	        {$$ = new Nodo ("EXPRESION","");
											$$.AgregarHijo(new Nodo ("-","menos"));	
											$$.AgregarHijo($2);	}
    | entero                                { $$ = new Nodo ("EXPRESION","");
											$$.AgregarHijo(new Nodo($1,"entero"));}
    | decimal                               {  $$ = new Nodo ("EXPRESION","");
											$$.AgregarHijo(new Nodo($1,"decimal")); }
    | Caracter                              {  $$ = new Nodo ("EXPRESION","");
											$$.AgregarHijo(new Nodo($1,"Caracter")); }
    | CADENA                                { $$ = new Nodo ("EXPRESION","");
											$$.AgregarHijo(new Nodo($1,"CADENA")); }
    | identificador                         {  $$ = new Nodo ("EXPRESION","");
											$$.AgregarHijo(new Nodo($1,"Id")); }
    | EXPRESION op_igual_igual EXPRESION        {  $$ = new Nodo ("EXPRESION",""); 
											$$.AgregarHijo($1);
											$$.AgregarHijo(new Nodo("==","op_igual_igual"));
											$$.AgregarHijo($3); }
    | EXPRESION op_not_igual EXPRESION         { $$ = new Nodo ("EXPRESION",""); 
											$$.AgregarHijo($1);
											$$.AgregarHijo(new Nodo("!=","op_not_igual"));
											$$.AgregarHijo($3);  }
    | EXPRESION menor EXPRESION          { $$ = new Nodo ("EXPRESION",""); 
											$$.AgregarHijo($1);
											$$.AgregarHijo(new Nodo("<","menor"));
											$$.AgregarHijo($3);  }
    | EXPRESION mayor EXPRESION          { $$ = new Nodo ("EXPRESION",""); 
											$$.AgregarHijo($1);
											$$.AgregarHijo(new Nodo(">","mayor"));
											$$.AgregarHijo($3);  }
    | EXPRESION op_menor_igual EXPRESION       { $$ = new Nodo ("EXPRESION",""); 
											$$.AgregarHijo($1);
											$$.AgregarHijo(new Nodo("<=","op_menor_igual"));
											$$.AgregarHijo($3);  }
    | EXPRESION op_mayorigual EXPRESION       { $$ = new Nodo ("EXPRESION",""); 
											$$.AgregarHijo($1);
											$$.AgregarHijo(new Nodo(">=","op_mayorigual"));
											$$.AgregarHijo($3);  }
    | EXPRESION op_and EXPRESION               { $$ = new Nodo ("EXPRESION",""); 
											$$.AgregarHijo($1);
											$$.AgregarHijo(new Nodo("&&","op_and"));
											$$.AgregarHijo($3);  }
    | EXPRESION op_or EXPRESION                { $$ = new Nodo ("EXPRESION",""); 
											$$.AgregarHijo($1);
											$$.AgregarHijo(new Nodo("||","op_or"));
											$$.AgregarHijo($3);  }
	| EXPRESION mas_mas                     {$$ = new Nodo ("EXPRESION",""); 
											$$.AgregarHijo($1);
											$$.AgregarHijo(new Nodo("++","mas_mas")); }
    | EXPRESION menos_menos                 {$$ = new Nodo ("EXPRESION",""); 
											$$.AgregarHijo($1);
											$$.AgregarHijo(new Nodo("--","menos_menos"));}
    | op_not EXPRESION %prec Uop_not        { $$ = new Nodo ("EXPRESION",""); 
											$$.AgregarHijo(new Nodo("!","op_not"));
											$$.AgregarHijo($2); }
    | parentesis_izq EXPRESION parentesis_der{ $$ = new Nodo ("EXPRESION",""); 
											$$.AgregarHijo(new Nodo("(","parenteisis_izq"));
											$$.AgregarHijo($2);
											$$.AgregarHijo(new Nodo(")","parentesis_der"));  }
;

TYPE: tk_int { $$ = new Nodo("TYPE","");
					$$.AgregarHijo(new Nodo($1,"int")); }
        | tk_double { $$ = new Nodo("TYPE","");
					$$.AgregarHijo(new Nodo($1,"double"));}
        | tk_String { $$ = new Nodo("TYPE","");
					$$.AgregarHijo(new Nodo($1,"String")); }
        | tk_boolean { $$ = new Nodo("TYPE","");
					$$.AgregarHijo(new Nodo($1,"boolean")); }
        | tk_char { $$ = new Nodo("TYPE","");
					$$.AgregarHijo(new Nodo($1,"char")); }
;



SENTENCIA_RETURN: tk_return EXPRESION { $$ = new Nodo("SENTENCIA_RETURN","");
											$$.AgregarHijo(new Nodo("return","tk_return"));
											$$.AgregarHijo($2);}
				| tk_return {$$ = new Nodo("SENTENCIA_RETURN","");
											$$.AgregarHijo(new Nodo("return","tk_return"));}

;


SENTENCIA_BC: tk_break  { $$ = new Nodo("SENTENCIA_BC","");
						  $$.AgregarHijo(new Nodo("break","tk_break"));
									
								  }
			| tk_continue  { $$ = new Nodo("SENTENCIA_BC","");
									  $$.AgregarHijo(new Nodo("continue","tk_continue"));
									    }
;

