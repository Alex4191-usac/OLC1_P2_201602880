# Proyecto 2 Compiladores 1 
## Traductor de Lenguaje Java a Javascript & Python


--- Funciones Principales
   - Analisis Lexico - (Analizador de Javascript )
   - Analisis Sintactico - (Analizador de Javscript)
   - Traducion de Codigo Java-Python
   - Analisis Lexico-Sintactico (Mediante la Herramienta JISON)
   - Traduccion de Codigo Java-Javascript
## Requisitos
- Navegador Compatible con JavaScript
- Node Js
- Docker

## Volumenes en docker-compose
Para utilizar volumenes en docker-compose

```
 sudo docker build -t nodeweb:v1 .
 sudo docker build -t goweb:v1 .
```
## Descripcion general de la aplicacion
la aplicacion permite cargar un tipo de archivo con extension .java. Este archivo contendra sentencias del propio lenguaje. La aplicacion realizara un analisis lexico y sintactico y a su vez realizara una traduccion a un lenguaje especifico, en este caso sera de Javascript y Python.

## Gramatica empleada para el analizador JISON

```jison

INICIO: LISTA_TIPO_INSTRUCCION EOF


LISTA_TIPO_INSTRUCCION: TIPO_INSTRUCCION | LISTA_TIPO_INSTRUCCION 

TIPO_INSTRUCCION: tk_public tk_class identificador BLOQUESENTENCIAS_PADRE
				| tk_public tk_interface identificador BLOQUESENTENCIAS_PADRE 
				

BLOQUESENTENCIAS_PADRE
					: llave_izq LISTA_SUB_INSTRUCCION llave_der

LISTA_SUB_INSTRUCCION:  SUB_INSTRUCCION LISTA_SUB_INSTRUCCION 
					| SUB_INSTRUCCION 


SUB_INSTRUCCION: tk_public tk_void identificador parentesis_izq PARAMETROS_METODO_FUNCION parentesis_der BLOQUESENTENCIAS_HIJO 
				| tk_public TYPE identificador parentesis_izq PARAMETROS_METODO_FUNCION parentesis_der BLOQUESENTENCIAS_HIJO 
				| tk_public tk_static tk_void tk_main parentesis_izq tk_String corchete_izq corchete_der tk_args parentesis_der BLOQUESENTENCIAS_HIJO 
				| DEFDECLARACION punto_coma 


BLOQUESENTENCIAS_HIJO 
				: llave_izq INSTRUCCIONES llave_der


PARAMETROS_METODO_FUNCION: TYPE EXP_NUMERICA L_PARAMETROS_METODO_FUNCION 
						| TYPE EXP_NUMERICA 
						| 


L_PARAMETROS_METODO_FUNCION:  coma TYPE EXP_NUMERICA L_PARAMETROS_METODO_FUNCION
						   | coma TYPE EXP_NUMERICA  



INSTRUCCIONES
	:  INSTRUCCION INSTRUCCIONES
	| INSTRUCCION	
				
INSTRUCCION
	: DEFDECLARACION punto_coma		
	| LLAMADA_METODO punto_coma    
   	| DEFIF					
   	| DEFWHILE					
	| DEFFOR					
	| DEFDO tk_while parentesis_izq EXP_LOGICA parentesis_der punto_coma 
    | DEFPRINT punto_coma 		
	| SENTENCIA_RETURN punto_coma 
	| SENTENCIA_BC punto_coma 


BLOQUESENTENCIAS
    : llave_izq INSTRUCCIONES llave_der	

DEFDECLARACION:   TYPE LISTA_VARIABLES  
				| TYPE LISTA_VARIABLES igual EXP_NUMERICA  
				| LISTA_VARIABLES igual EXP_NUMERICA  
				| identificador mas mas  
				| identificador MENOS MENOS 


LISTA_VARIABLES:  coma identificador LISTA_VARIABLES  
				| identificador 




LLAMADA_METODO: identificador parentesis_izq LLAMADA_PARAMETRO parentesis_de
		
	
 


LLAMADA_PARAMETRO: EXP_NUMERICA LISTA_LLAMADA_PARAMETRO
				 | EXP_NUMERICA 
				 |
				 

LISTA_LLAMADA_PARAMETRO: LISTA_LLAMADA_PARAMETRO coma EXP_NUMERICA 
				| coma EXP_NUMERICA

DEFIF
    : tk_if parentesis_izq EXP_LOGICA parentesis_der BLOQUESENTENCIAS	
    | tk_if parentesis_izq EXP_LOGICA parentesis_der BLOQUESENTENCIAS tk_else BLOQUESENTENCIAS
    | tk_if parentesis_izq EXP_LOGICA parentesis_der BLOQUESENTENCIAS tk_else DEFIF	

DEFPRINT
    : tk_System punto tk_out punto tk_println parentesis_izq EXP_NUMERICA parentesis_der 
	| tk_System punto tk_out punto tk_print parentesis_izq EXP_NUMERICA parentesis_der


DEFWHILE
    
    : tk_while parentesis_izq EXP_LOGICA parentesis_der BLOQUESENTENCIAS 
    


DEFFOR : 
	tk_for parentesis_izq DEFDECLARACION punto_coma EXP_LOGICA punto_coma DECLARACION_CONTADOR parentesis_der BLOQUESENTENCIAS 											


DEFDO 

	: tk_do BLOQUESENTENCIAS 


TYPE: tk_int 
        | tk_double
        | tk_String 
        | tk_boolean 
        | tk_char 



SENTENCIA_RETURN: tk_return EXP_NUMERICA 
				| tk_return


SENTENCIA_BC: tk_break 
			| tk_continue  

DECLARACION_CONTADOR:  mas mas 
					|  MENOS MENOS 

EXP_LOGICA
	: EXP_RELACIONAL op_and EXP_RELACIONAL  
	| EXP_RELACIONAL op_or EXP_RELACIONAL 		
	| op_not EXP_RELACIONAL						
	| EXP_RELACIONAL							

EXP_RELACIONAL
	: EXP_NUMERICA mayor EXP_NUMERICA		
	| EXP_NUMERICA menor EXP_NUMERICA		
	| EXP_NUMERICA op_mayorigual EXP_NUMERICA 
	| EXP_NUMERICA op_menor_igual EXP_NUMERICA	
	| EXP_NUMERICA op_not_igual EXP_NUMERICA		
	| EXP_NUMERICA

EXP_NUMERICA
	
	: EXP_NUMERICA mas EXP_NUMERICA		
	| EXP_NUMERICA MENOS EXP_NUMERICA		
	| EXP_NUMERICA por EXP_NUMERICA		
	| EXP_NUMERICA dividido EXP_NUMERICA	
	| MENOS EXP_NUMERICA %prec UMENOS 	
	| EXP_NUMERICA op_xor EXP_NUMERICA
	| parentesis_izq EXP_NUMERICA parentesis_der 			
	| entero					
	| decimal					
	| CADENA					
	| Caracter						
	| identificador				


```


# Detalle de clases


| BACKEND   | 
|----------|
| AsTree.js |   
| gramatica.jison|  
| gramatica.js |
| index.js |
| Token.js |
| recorrido.js |

------
	>>> AsTree.js: clase que contiene los atributos de la estructura empleada para el reporte del analisis Sintactico.

	>>> Gramatica.jison: es el archivo que contiene la gramatica base para realizar el metodo Parse que forma parte del analisis sintactico.

	>>> Gramatica.js: es la clase "compilada" generada por el archivo gramatica.jison mediante el comando: jison gramatica.jison.

	>>> index.js: es la clase base que funciona como intermediario del servidor Backend.

	>>> Token.js : clase que contiene los atributos de la estructura empleada para el almacenar la recoleccion de tokens del analisis lexico y reporte.

	>>> recorrido.js: clase que permite crear el string de la structura para poder graficarla, ademas contiene el metodo del recorrido para la traduccion.
------
	
| FRONTEND   |
|----------|
| main.go |   
| index.html |  

------

```
>>>main.go: clase que principal del servidor frontend ,contiene que cordina las peticiones de node js.

>>>index.html: clase que contiene las etiquetas que componen la estructura de la pagina principal
````

-----