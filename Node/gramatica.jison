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
//fila,columna,lexema,tipo,correlativo
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

%left 'mas' 'MENOS'
%left 'por' 'dividido'
%left 'op_xor'
%right 'UMENOS'

%start INICIO

%%

INICIO: INSTRUCCIONES EOF  { $$=new Nodo("INICIO");
							$$.AgregarHijo($1);
							let tempErrores =[];
							let tempTokens =[]
							tempErrores = Error_Array;
							tempTokens = Token_List;
							Error_Array = [];
							Token_List = []
							return {ast:$$ , lista_error: tempErrores, lista_token: tempTokens}; };

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
				| tk_public TIPO_DATO identificador parentesis_izq PARAMETROS_METODO_FUNCION parentesis_der llave_izq LISTA_SUBINSTRUCCION SENTENCIA_RETURN punto_coma llave_der {$$ = new Nodo("METODO_FUNCION");
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



SUB_INSTRUCCION_INTERFACE:  SUB_INSTRUCCION_INTERFACE LLAMADA_METODO {$$ = new Nodo("SUB_INSTRUCCION_INTERFACE");
														                      $$.AgregarHijo($1);
																			   $$.AgregarHijo($2);	}
						 | LLAMADA_METODO {$$ = new Nodo("SUB_INSTRUCCION_INTERFACE");
										  $$.AgregarHijo($1);}
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
				| SENTENCIA_IMPRIMIR{$$= new Nodo("LISTA_SUBINSTRUCCION");
									$$.AgregarHijo($1);}
				| error punto_coma{Error_Array.push('Este es un error Sintactico: ' + yytext + ', en la linea: ' + yylloc.first_line + ', en la columna: ' + yylloc.first_column);}

;
SENTENCIA_IMPRIMIR:
				tk_System punto tk_out punto tk_println parentesis_izq EXP_NUMERICA parentesis_der punto_coma {$$ = new Nodo("SENTENCIA_IMPRIMIR");
																												$$.AgregarHijo(new Nodo("System","tk_System"));
																												$$.AgregarHijo(new Nodo(".","tk_dot"));
																												$$.AgregarHijo(new Nodo("out","tk_out"));
																												$$.AgregarHijo(new Nodo(".","tk_dot"));
																												$$.AgregarHijo(new Nodo("println","tk_print"));
																												$$.AgregarHijo(new Nodo("(","par_izq"));
																										 		$$.AgregarHijo($7);
																										 		$$.AgregarHijo(new Nodo(")","par_der"));
																												$$.AgregarHijo(new Nodo(";","punto_coma")); }
				| tk_System punto tk_out punto tk_print parentesis_izq EXP_NUMERICA parentesis_der punto_coma {$$ = new Nodo("SENTENCIA_IMPRIMIR");
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
				| identificador MENOS MENOS punto_coma {  $$ = new Nodo("DECLARACION");
														  $$.AgregarHijo(new Nodo($3,"Id"));
														  $$.AgregarHijo(new Nodo("-","menos"));
								   						  $$.AgregarHijo(new Nodo("-","menos"));
														  $$.AgregarHijo(new Nodo(";","punto_coma"));
															  }
				
				
;

DECLARACION_CONTADOR:  mas mas { $$ = new Nodo("DECLARACION_CONTADOR"); 
							      $$.AgregarHijo(new Nodo("+","mas"));
								   $$.AgregarHijo(new Nodo("+","mas")); }
					|  MENOS MENOS { $$ = new Nodo("DECLARACION_CONTADOR");
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
												  $$.AgregarHijo(new Nodo($2,"Id"));
												  $$.AgregarHijo($3); }
						| TIPO_DATO identificador {$$ = new Nodo("PARAMETROS_METODO_FUNCION");
											      $$.AgregarHijo($1);
												  $$.AgregarHijo(new Nodo($2,"Id"));}
						| ; 

L_PARAMETROS_METODO_FUNCION: L_PARAMETROS_METODO_FUNCION coma TIPO_DATO identificador  {$$ = new Nodo("L_PARAMETROS_METODO_FUNCION");
																						$$.AgregarHijo($1);
																						$$.AgregarHijo(new Nodo(",","coma"));
																						$$.AgregarHijo($3);
																						$$.AgregarHijo(new Nodo($4,"Id")); }
						   | coma TIPO_DATO identificador  { $$ = new Nodo("L_PARAMETROS_METODO_FUNCION");
															$$.AgregarHijo(new Nodo(",","comma"));
															$$.AgregarHijo($2);
															$$.AgregarHijo(new Nodo($3,"Id")); } ;




LLAMADA_METODO: identificador parentesis_izq LLAMADA_PARAMETRO parentesis_der punto_coma { 
		$$ = new Nodo("LLAMADA_METODO");
		$$.AgregarHijo(new Nodo($1,"id"));
		$$.AgregarHijo(new Nodo("(","par_izq"));
		$$.AgregarHijo($3);
		$$.AgregarHijo(new Nodo(")","par_der"));
		$$.AgregarHijo(new Nodo(";","punto_coma"));}
		
	
 
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
	| EXP_NUMERICA MENOS EXP_NUMERICA		{  $$ = new Nodo("EXP_NUMERICA","");
										 		$$.AgregarHijo($1);
												$$.AgregarHijo(new Nodo("-","menos"));
												$$.AgregarHijo($3); }
	| EXP_NUMERICA por EXP_NUMERICA			{  $$ = new Nodo("EXP_NUMERICA","");
										 		$$.AgregarHijo($1);
												$$.AgregarHijo(new Nodo("*","por"));
												$$.AgregarHijo($3); }

	| EXP_NUMERICA dividido EXP_NUMERICA	{  $$ = new Nodo("EXP_NUMERICA","");
										 		$$.AgregarHijo($1);
												$$.AgregarHijo(new Nodo("/","dividido"));
												$$.AgregarHijo($3); }
	| MENOS EXP_NUMERICA %prec UMENOS { $$ = new Nodo("EXP_NUMERICA","");
											$$.AgregarHijo(new Nodo("-","menos"));
											$$.AgregarHijo($2);
											
										 }	
			
	| EXP_NUMERICA op_xor EXP_NUMERICA	{$$ = new Nodo("EXP_NUMERICA","");
										 		$$.AgregarHijo($1);
												$$.AgregarHijo(new Nodo("^","XOR"));
												$$.AgregarHijo($3);}
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
					$$.AgregarHijo(new Nodo($1,"double"));}
        | tk_String { $$ = new Nodo("TIPO_DATO","");
					$$.AgregarHijo(new Nodo($1,"String")); }
        | tk_boolean { $$ = new Nodo("TIPO_DATO","");
					$$.AgregarHijo(new Nodo($1,"boolean")); }
        | tk_char { $$ = new Nodo("TIPO_DATO","");
					$$.AgregarHijo(new Nodo($1,"char")); }
;


SENTENCIA_RETURN: tk_return EXP_NUMERICA { $$ = new Nodo("SENTENCIA_RETURN","");
											$$.AgregarHijo(new Nodo("return","tk_return"));
											$$.AgregarHijo($2);}
				| tk_return {$$ = new Nodo("SENTENCIA_RETURN","");
											$$.AgregarHijo(new Nodo("return","tk_return"));}

;


SENTENCIA_BC: tk_break punto_coma { $$ = new Nodo("SENTENCIA_BC","");
									$$.AgregarHijo($1);
									$$.AgregarHijo($2);  }
			| tk_continue punto_coma { $$ = new Nodo("SENTENCIA_BC","");
									   $$.AgregarHijo($1);
									   $$.AgregarHijo($2); }
			|;




