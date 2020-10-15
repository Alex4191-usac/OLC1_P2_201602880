%{
	const Nodo = require('./AstTree');
%}
/*--------------------------------------------analisis lexico--------------------------*/
%lex
%options case-insensitive
%%


[/][*][^*]*[*]+([^/*][^*]*[*]+)*[/]			// comentario multiple líneas		
"//".*										// comentario simple línea

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
"^"                 %{return 'op_xor';%}
"+"					%{return 'mas';%}
"-"					%{return 'menos';%}
"*"					%{return 'por';%}
"/"					%{return 'dividido';%}
">"                 %{return 'mayor';%}
"<"                 %{return 'menor';%}
"="                 %{return 'igual'; %}
"!"                 %{return 'op_not';%}
/* --------------------------especiales--------------------------------------*/

[ \r\t\f]+            %{ /*ignore */%}
\n                  %{/*it will count */%}
\s+                                 // se ignoran espacios en blanco
	

/*---------------------- EXPRESIONES REGULARES-------------------------*/

\"[^\"]*\"              %{yytext = yytext.substr(1,yyleng-2); return 'CADENA'; %}
"'"[^']"'"				%{yytext = yytext.substr(1,yyleng-2); return 'Caracter'; %}
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

INICIO: INSTRUCCIONES EOF  { $$=new Nodo("INICIO");
							$$.AgregarHijo($1);
							console.log($$);
							return $$; };

INSTRUCCIONES: INSTRUCCIONES TIPO_INSTRUCCION {$$ = new Nodo("INSTRUCCIONES");
											   $$.AgregarHijo($1);
												$$.AgregarHijo($2); }
            |  TIPO_INSTRUCCION {$$ = new Nodo("INSTRUCCIONES");
								 $$.AgregarHijo($1); }
           
;

TIPO_INSTRUCCION: tk_public tk_class identificador llave_izq LISTA_METODO_FUNCION llave_der { $$ = new Nodo("TIPO_INSTRUCCION");
																							  $$.AgregarHijo(new Nodo("public","tk_public"));
																							  $$.AgregarHijo(new Nodo("class","tk_class"));
																							  $$.AgregarHijo(new Nodo($3,"Id"));
																							  $$.AgregarHijo(new Nodo("{","llave_izq"));
																							  $$.AgregarHijo($5);
																							  $$.AgregarHijo(new Nodo("}","llave_der"));}
                | tk_public tk_interface identificador llave_izq LISTA_METODO_FUNCION llave_der {$$ = new Nodo("TIPO_INSTRUCCION");
																								$$.AgregarHijo(new Nodo("public","tk_public"));
																								$$.AgregarHijo(new Nodo("interface","tk_interface"));
																								$$.AgregarHijo(new Nodo("{","llave_izq"));
																							  	$$.AgregarHijo($5);
																							  	$$.AgregarHijo(new Nodo("}","llave_der"));}
;

LISTA_METODO_FUNCION: LISTA_METODO_FUNCION METODO_FUNCION  {  $$ = new Nodo("LISTA_METODO_FUNCION");
															  $$.AgregarHijo($1);
															  $$.AgregarHijo($2);}
					| METODO_FUNCION {$$ = new Nodo("LISTA_METODO_FUNCION");
									  $$.AgregarHijo($1); }
;

METODO_FUNCION:   tk_public tk_void identificador parentesis_izq PARAMETROS_METODO_FUNCION parentesis_der llave_izq LISTA_SUBINSTRUCCION llave_der {$$ = new Nodo("METODO_FUNCION");
																																					$$.AgregarHijo(new Nodo("public","tk_public"));
																																					$$.AgregarHijo(new Nodo("void","tk_void"));	
																																					$$.AgregarHijo(new Nodo($3,"Id"));	
																																					$$.AgregarHijo(new Nodo("(","par_izq"));
																																					$$.AgregarHijo($5);	
																																					$$.AgregarHijo(new Nodo(")","par_der"));
																																					$$.AgregarHijo(new Nodo("{","llave_izq"));
																																					$$.AgregarHijo($8);
																																					$$.AgregarHijo(new Nodo("}","llave_der"));					
																																													}
				| tk_public TIPO_DATO identificador parentesis_izq PARAMETROS_METODO_FUNCION parentesis_der llave_izq LISTA_SUBINSTRUCCION SENTENCIA_RETURN  punto_coma llave_der {$$ = new Nodo("METODO_FUNCION");
																																					$$.AgregarHijo(new Nodo("public","tk_public"));
																																					$$.AgregarHijo($2);	
																																					$$.AgregarHijo(new Nodo($3,"Id"));	
																																					$$.AgregarHijo(new Nodo("(","par_izq"));
																																					$$.AgregarHijo($5);	
																																					$$.AgregarHijo(new Nodo(")","par_der"));
																																					$$.AgregarHijo(new Nodo("{","llave_izq"));
																																					$$.AgregarHijo($8);
																																					$$.AgregarHijo($9);
																																					
																																					$$.AgregarHijo(new Nodo(";","punto_coma"));
																																				    $$.AgregarHijo(new Nodo("}","llave_der"));
																																					}

				| tk_public tk_static tk_void tk_main parentesis_izq tk_String corchete_izq corchete_der tk_args parentesis_der llave_izq LISTA_SUBINSTRUCCION llave_der {$$ = new Nodo("METODO_FUNCION");
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
																																					$$.AgregarHijo(new Nodo("{","llave_izq"));
																																					$$.AgregarHijo($12);
																																					$$.AgregarHijo(new Nodo("}","llave_der"));}
				| DECLARACION {$$ = new Nodo("METODO_FUNCION");
							    $$.AgregarHijo($1); }
;

LISTA_SUBINSTRUCCION: LISTA_SUBINSTRUCCION SUB_INSTRUCCION  { $$ = new Nodo("LISTA_SUBINSTRUCCION");
															  $$.AgregarHijo($1);
															  $$.AgregarHijo($2);}
					| SUB_INSTRUCCION {$$ = new Nodo("LISTA_SUBINSTRUCCION");
									  $$.AgregarHijo($1); }
;

SUB_INSTRUCCION: 
			     DECLARACION {$$ = new Nodo("LISTA_SUBINSTRUCCION");
									 $$.AgregarHijo($1);}
				|LLAMADA_METODO {$$ = new Nodo("LISTA_SUBINSTRUCCION");
									 $$.AgregarHijo($1);}
				| tk_for parentesis_izq DECLARACION EXP_LOGICA punto_coma  identificador DECLARACION_CONTADOR parentesis_der llave_izq LISTA_SUBINSTRUCCION SENTENCIA_BC llave_der {$$ = new Nodo("LISTA_SUBINSTRUCCION");
																																													$$.AgregarHijo(new Nodo("for","tk_for"));
																																													$$.AgregarHijo(new Nodo("(","par_izq"));
																										 																			$$.AgregarHijo($3);
																																													$$.AgregarHijo($4);
																																													$$.AgregarHijo(new Nodo(";","punto_coma"));
																																													$$.AgregarHijo(new Nodo($6,"Id"));
																																													$$.AgregarHijo($7);
																										 																			$$.AgregarHijo(new Nodo(")","par_der"));
																																													$$.AgregarHijo(new Nodo("{","llave_izq"));
																																													$$.AgregarHijo($9);
																																													$$.AgregarHijo($10);
																																													$$.AgregarHijo(new Nodo("}","llave_der"));



				}
				| tk_while parentesis_izq EXP_LOGICA parentesis_der llave_izq LISTA_SUBINSTRUCCION SENTENCIA_BC  llave_der {
																												$$ = new Nodo("LISTA_SUBINSTRUCCION");
																												$$.AgregarHijo(new Nodo("while","tk_whilet"));
																												$$.AgregarHijo(new Nodo("(","par_izq"));
																										 		$$.AgregarHijo($3);
																										 		$$.AgregarHijo(new Nodo(")","par_der"));
																												$$.AgregarHijo(new Nodo("{","llave_izq"));
																												$$.AgregarHijo($6);
																												$$.AgregarHijo($7);
																												$$.AgregarHijo(new Nodo("}","llave_der"));
				}
				| tk_do llave_izq LISTA_SUBINSTRUCCION SENTENCIA_BC llave_der tk_while parentesis_izq EXP_LOGICA parentesis_der punto_coma {$$ = new Nodo("LISTA_SUBINSTRUCCION");
																												$$.AgregarHijo(new Nodo("do","tk_Do"));
																												$$.AgregarHijo(new Nodo("{","llave_izq"));
																												$$.AgregarHijo($3);
																												$$.AgregarHijo($4);
																												$$.AgregarHijo(new Nodo("}","llave_der"));
																												$$.AgregarHijo(new Nodo("while","tk_whilet"));
																												$$.AgregarHijo(new Nodo("(","par_izq"));
																										 		$$.AgregarHijo($8);
																										 		$$.AgregarHijo(new Nodo(")","par_der"));
																												$$.AgregarHijo(new Nodo(";","punto_coma"));}
				| SENTENCIA_CONTROL {$$ = new Nodo("LISTA_SUBINSTRUCCION");
									 $$.AgregarHijo($1);}
				| tk_System punto tk_out punto tk_println parentesis_izq EXP_NUMERICA parentesis_der punto_coma {$$ = new Nodo("LISTA_SUBINSTRUCCION");
																												$$.AgregarHijo(new Nodo("System","tk_System"));
																												$$.AgregarHijo(new Nodo(".","tk_dot"));
																												$$.AgregarHijo(new Nodo("out","tk_out"));
																												$$.AgregarHijo(new Nodo(".","tk_dot"));
																												$$.AgregarHijo(new Nodo("println","tk_print"));
																												$$.AgregarHijo(new Nodo("(","par_izq"));
																										 		$$.AgregarHijo($7);
																										 		$$.AgregarHijo(new Nodo(")","par_der"));
																												$$.AgregarHijo(new Nodo(";","punto_coma")); }
				| tk_System punto tk_out punto tk_print parentesis_izq EXP_NUMERICA parentesis_der punto_coma {$$ = new Nodo("LISTA_SUBINSTRUCCION");
																												$$.AgregarHijo(new Nodo("System","tk_System"));
																												$$.AgregarHijo(new Nodo(".","tk_dot"));
																												$$.AgregarHijo(new Nodo("out","tk_out"));
																												$$.AgregarHijo(new Nodo(".","tk_dot"));
																												$$.AgregarHijo(new Nodo("print","tk_print"));
																												$$.AgregarHijo(new Nodo("(","par_izq"));
																										 		$$.AgregarHijo($7);
																										 		$$.AgregarHijo(new Nodo(")","par_der"));
																												$$.AgregarHijo(new Nodo(";","punto_coma"));
																																				  }
;

SENTENCIA_CONTROL:
				  tk_if parentesis_izq EXP_LOGICA parentesis_der llave_izq SUB_INSTRUCCION llave_der  {$$ = new Nodo("SENTENCIA_CONTROL");
				  																					   $$.AgregarHijo(new Nodo("if","tk_if"));
																										 $$.AgregarHijo(new Nodo("(","par_izq"));
																										 $$.AgregarHijo($3);
																										 $$.AgregarHijo(new Nodo(")","par_der"));
																										 $$.AgregarHijo(new Nodo("{","llave_izq"));
																										 $$.AgregarHijo($6);
																										 $$.AgregarHijo(new Nodo("}","llave_der"));
																										  }
				| tk_if parentesis_izq EXP_LOGICA parentesis_der llave_izq SUB_INSTRUCCION llave_der tk_else llave_izq SUB_INSTRUCCION llave_der  {$$ = new Nodo("SENTENCIA_CONTROL");
				  																					   												$$.AgregarHijo(new Nodo("if","tk_if"));
																										 											$$.AgregarHijo(new Nodo("(","par_izq"));
																										 											$$.AgregarHijo($3);
																																					$$.AgregarHijo(new Nodo(")","par_der"));
																																					$$.AgregarHijo(new Nodo("{","llave_izq"));
																																					$$.AgregarHijo($6);
																																					$$.AgregarHijo(new Nodo("}","llave_der"));
																																					$$.AgregarHijo(new Nodo("else","tk_else"));
																																					$$.AgregarHijo(new Nodo("{","llave_izq"));
																																					$$.AgregarHijo($10);
																																					$$.AgregarHijo(new Nodo("}","llave_der"));

																																				}
				| tk_if parentesis_izq EXP_LOGICA parentesis_der llave_izq SUB_INSTRUCCION llave_der tk_else SENTENCIA_CONTROL {$$ = new Nodo("SENTENCIA_CONTROL");
				  																					   							$$.AgregarHijo(new Nodo("if","tk_if"));
																										 						$$.AgregarHijo(new Nodo("(","par_izq"));
																										 						$$.AgregarHijo($3);
																																$$.AgregarHijo(new Nodo(")","par_der"));
																																$$.AgregarHijo(new Nodo("{","llave_izq"));
																																$$.AgregarHijo($6);
																																$$.AgregarHijo(new Nodo("}","llave_der"));
																																$$.AgregarHijo(new Nodo("else","tk_else"));
																																$$.AgregarHijo($9);
					
				}
;



DECLARACION:    TIPO_DATO LISTA_VARIABLES punto_coma {$$ = new Nodo("DECLARACION");
														$$.AgregarHijo($1);
														$$.AgregarHijo($2);
														$$.AgregarHijo(new Nodo(";","punto_coma"));}
				| TIPO_DATO LISTA_VARIABLES igual EXP_NUMERICA punto_coma { $$ = new Nodo("DECLARACION");
																			$$.AgregarHijo($1);
																			$$.AgregarHijo($2);
																			$$.AgregarHijo(new Nodo("=","igual"));
																			$$.AgregarHijo($4);
																			 $$.AgregarHijo(new Nodo(";","punto_coma"));}
				| LISTA_VARIABLES igual EXP_NUMERICA punto_coma {$$ = new Nodo("DECLARACION");
																 $$.AgregarHijo($1);
																$$.AgregarHijo(new Nodo("=","igual"));
																$$.AgregarHijo($3);
																$$.AgregarHijo(new Nodo(";","punto_coma"));}
				| identificador mas mas punto_coma { 	  $$ = new Nodo("DECLARACION");
														  $$.AgregarHijo(new Nodo($3,"Id"));
														  $$.AgregarHijo(new Nodo("+","mas"));
								   						  $$.AgregarHijo(new Nodo("+","mas"));
														  $$.AgregarHijo(new Nodo(";","punto_coma"));}
				| identificador menos menos punto_coma {  $$ = new Nodo("DECLARACION");
														  $$.AgregarHijo(new Nodo($3,"Id"));
														  $$.AgregarHijo(new Nodo("-","menos"));
								   						  $$.AgregarHijo(new Nodo("-","menos"));
														  $$.AgregarHijo(new Nodo(";","punto_coma"));
															  }
				
;

DECLARACION_CONTADOR:  mas mas { $$ = new Nodo("DECLARACION_CONTADOR"); 
							      $$.AgregarHijo(new Nodo("+","mas"));
								   $$.AgregarHijo(new Nodo("+","mas")); }
					|  menos menos { $$ = new Nodo("DECLARACION_CONTADOR");
					 				$$.AgregarHijo(new Nodo("-","menos"));
					  				$$.AgregarHijo(new Nodo("-","menos")); }

;

LISTA_VARIABLES: LISTA_VARIABLES coma identificador  {$$ = new Nodo("LISTA_VARIABLES");
													  $$.AgregarHijo($1);
													  $$.AgregarHijo(new Nodo(",","coma"));
													  $$.AgregarHijo(new Nodo($3,"Id"));}
				| identificador {$$ = new Nodo("LISTA_VARIABLES");
						$$.AgregarHijo(new Nodo($1,"Id"));}
;


PARAMETROS_METODO_FUNCION: TIPO_DATO identificador L_PARAMETROS_METODO_FUNCION { $$ = new Nodo("PARAMETROS_METODO_FUNCION");
											      $$.AgregarHijo($1);
												  $$.AgregarHijo(new Nodo($1,"Id"));
												  $$.AgregarHijo($3); }
						| TIPO_DATO identificador {$$ = new Nodo("PARAMETROS_METODO_FUNCION");
											      $$.AgregarHijo($1);
												  $$.AgregarHijo(new Nodo($1,"Id"));}
						| ; 

L_PARAMETROS_METODO_FUNCION: L_PARAMETROS_METODO_FUNCION coma TIPO_DATO identificador  {$$ = new Nodo("L_PARAMETROS_METODO_FUNCION");
																						$$.AgregarHijo($1);
																						$$.AgregarHijo(new Nodo(",","coma"));
																						$$.AgregarHijo($3);
																						$$.AgregarHijo($4);
																						$$.AgregarHijo(new Nodo($1,"Id")); }
						   | coma TIPO_DATO identificador  { $$ = new Nodo("L_PARAMETROS_METODO_FUNCION");
															$$.AgregarHijo(new Nodo(",","comma"));
															$$.AgregarHijo($2); } ;




LLAMADA_METODO: identificador parentesis_izq LLAMADA_PARAMETRO parentesis_der punto_coma { 
		$$ = new Nodo("LLAMADA_METODO");
		$$.AgregarHijo(new Nodo($1,"id"));
		$$.AgregarHijo(new Nodo("(","par_izq"));
		$$.AgregarHijo($3);
		$$.AgregarHijo(new Nodo(")","par_der"));
		$$.AgregarHijo(new Nodo(";","punto_coma"));
 }
;

LLAMADA_PARAMETRO: EXP_NUMERICA LISTA_LLAMADA_PARAMETRO { $$= new Nodo("LLAMADA_PARAMETRO","");
				 				 						  $$.AgregarHijo($1);
															$$.AgregarHijo($2);  }
				 | EXP_NUMERICA {$$= new Nodo("LLAMADA_PARAMETRO","");
				 				 $$.AgregarHijo($1);}
				 |;

LISTA_LLAMADA_PARAMETRO: LISTA_LLAMADA_PARAMETRO coma EXP_NUMERICA  { $$ = new Nodo("LISTA_LLAMADA_PARAMETRO","");
																	  $$.AgregarHijo($1);
																	  $$.AgregarHijo(new Nodo(",","comma"))
																	  $$.AgregarHijo($3);}
				| coma EXP_NUMERICA {$$ = new Nodo("LISTA_LLAMADA_PARAMETRO","");
									 $$.AgregarHijo(new Nodo(",","comma"));
									 $$.AgregarHijo($2);}								   }
;


EXP_LOGICA
	: EXP_RELACIONAL op_and EXP_RELACIONAL     {$$ = new Nodo("EXP_LOGICA","");
										 	  	$$.AgregarHijo($1);
											  	$$.AgregarHijo(new Nodo("&&","op_and"));
											  	$$.AgregarHijo($3);  }
	| EXP_RELACIONAL op_or EXP_RELACIONAL 		{$$ = new Nodo("EXP_LOGICA","");
										 	  	$$.AgregarHijo($1);
											  	$$.AgregarHijo(new Nodo("||","op_or"));
											  	$$.AgregarHijo($3);  }
	| op_not EXP_RELACIONAL						{$$ = new Nodo("EXP_LOGICA","");
												 $$.AgregarHijo(new Nodo("!","not"));
												 $$.AgregarHijo($2);  }	
	| EXP_RELACIONAL							{ $$ = new Nodo("EXP_LOGICA","");
												$$.AgregarHijo($1); }	
;

EXP_RELACIONAL
	: EXP_NUMERICA mayor EXP_NUMERICA		{ $$ = new Nodo("EXP_RELACIONAL","");
										 	  $$.AgregarHijo($1);
											  $$.AgregarHijo(new Nodo(">","mayor"));
											  $$.AgregarHijo($3); }
	| EXP_NUMERICA menor EXP_NUMERICA		{ $$ = new Nodo("EXP_RELACIONAL","");
										 	  $$.AgregarHijo($1);
											  $$.AgregarHijo(new Nodo("<","menor"));
											  $$.AgregarHijo($3); }
	| EXP_NUMERICA op_mayorigual EXP_NUMERICA { $$ = new Nodo("EXP_RELACIONAL","");
										 	  $$.AgregarHijo($1);
											  $$.AgregarHijo(new Nodo(">=","mayor_igual"));
											  $$.AgregarHijo($3);  }
	| EXP_NUMERICA op_menor_igual EXP_NUMERICA	{ $$ = new Nodo("EXP_RELACIONAL","");
										 	  $$.AgregarHijo($1);
											  $$.AgregarHijo(new Nodo("<=","menor_igual"));
											  $$.AgregarHijo($3); }
	| EXP_NUMERICA op_igual_igual EXP_NUMERICA			{ $$ = new Nodo("EXP_RELACIONAL","");
										 	  			  $$.AgregarHijo($1);
											  			  $$.AgregarHijo(new Nodo("==","igual_igual"));
											  			  $$.AgregarHijo($3);  }
	| EXP_NUMERICA op_not_igual EXP_NUMERICA			{ $$ = new Nodo("EXP_RELACIONAL","");
										 	  			  $$.AgregarHijo($1);
											  			  $$.AgregarHijo(new Nodo("!=","not_igual"));
											  			  $$.AgregarHijo($3); }
	| EXP_NUMERICA {$$ = new Nodo("EXP_RELACIONAL","");
					$$.AgregarHijo($1);}
;

EXP_NUMERICA
				
	: EXP_NUMERICA mas EXP_NUMERICA		{ $$ = new Nodo("EXP_NUMERICA","");
										 	$$.AgregarHijo($1);
											$$.AgregarHijo(new Nodo("+","mas"));
											$$.AgregarHijo($3);
										 }	
	| EXP_NUMERICA menos EXP_NUMERICA		{  $$ = new Nodo("EXP_NUMERICA","");
										 		$$.AgregarHijo($1);
												$$.AgregarHijo(new Nodo("-","menos"));
												$$.AgregarHijo($3); }
	| EXP_NUMERICA por EXP_NUMERICA			{  $$ = new Nodo("EXP_NUMERICA","");
										 		$$.AgregarHijo($1);
												$$.AgregarHijo(new Nodo("*","por"));
												$$.AgregarHijo($3); }

	| EXP_NUMERICA dividido EXP_NUMERICA	{  $$ = new Nodo("EXP_NUMERICA","");
										 		$$.AgregarHijo($1);
												$$.AgregarHijo(new Nodo("+","mas"));
												$$.AgregarHijo($3); }
	| parentesis_izq EXP_NUMERICA parentesis_der { $$ = new Nodo("EXP_NUMERICA","");
													$$.AgregarHijo(new Nodo("(","parentesis_izq"));
													$$.AgregarHijo($2);
													$$.AgregarHijo(new Nodo(")","parentesis_der"));
												 }					
	| entero					{  $$ = new Nodo("EXP_NUMERICA","");
								   $$.AgregarHijo(new Nodo($1,"entero")); }						
	| decimal					{ $$ = new Nodo("EXP_NUMERICA","");
								   $$.AgregarHijo(new Nodo($1,"decimal")) }
	| CADENA					{ $$ = new Nodo("EXP_NUMERICA","");
								   $$.AgregarHijo(new Nodo($1,"cadena"))}
	| Caracter					{ $$ = new Nodo("EXP_NUMERICA","");
								   $$.AgregarHijo(new Nodo($1,"caracter"))}	
	| identificador				{ $$ = new Nodo("EXP_NUMERICA","");
								   $$.AgregarHijo(new Nodo($1,"id")); }						
;



TIPO_DATO: tk_int { $$ = new Nodo("TIPO_DATO","");
					$$.AgregarHijo(new Nodo($1,"int")); }
        | tk_double { $$ = new Nodo("TIPO_DATO","");
					$$.AgregarHijo(new Nodo($1,"int"));}
        | tk_String { $$ = new Nodo("TIPO_DATO","");
					$$.AgregarHijo(new Nodo($1,"int")); }
        | tk_boolean { $$ = new Nodo("TIPO_DATO","");
					$$.AgregarHijo(new Nodo($1,"int")); }
        | tk_char { $$ = new Nodo("TIPO_DATO","");
					$$.AgregarHijo(new Nodo($1,"int")); }
;

SENTENCIA_BC: tk_break punto_coma { $$ = new Nodo("SENTENCIA_BC","");
									$$.AgregarHijo($1);
									$$.AgregarHijo($2);  }
			| tk_continue punto_coma { $$ = new Nodo("SENTENCIA_BC","");
									   $$.AgregarHijo($1);
									   $$.AgregarHijo($2); }
			|

;

SENTENCIA_RETURN: tk_return EXP_NUMERICA { $$ = new Nodo("SENTENCIA_RETURN","");
											$$.AgregarHijo(new Node("return","tk_return"));
											$$.AgregarHijo($2);}
				| tk_return {$$ = new Nodo("SENTENCIA_RETURN","");
											$$.AgregarHijo(new Node("return","tk_return"));}

;


