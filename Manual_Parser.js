const Token = require('./Token.js');
class Manual_Parser{

    constructor(){
        this.post_analisis = new Token();
        this.Numb_post_analisis;
        this.TokenL=[];
        this.PyhtonCode="";
        this.Identacion=0;
    }
   
    LL_Parser(Token_List){
        this.TokenL=Token_List;
        this.post_analisis = this.TokenL[0];
        this.Numb_post_analisis=0;
        this.INICIO();
        console.log("finalizado")
        console.log(this.PyhtonCode);
    }
    INICIO(){
        this.INSTRUCCIONES();
        
        
    }
    INSTRUCCIONES(){
        if(this.post_analisis.tipo==="tk_public"){
            this.match("tk_public");
            this.TIPO_INSTRUCCION();
            this.INSTRUCCIONES();
        }else if(this.post_analisis.tipo==="tk_comentario_simple"){
            this.SENTENCIA_COMENTARIO();
            this.INSTRUCCIONES();

        }
        
        
    }
    TIPO_INSTRUCCION(){
        if(this.post_analisis.tipo==="tk_class"){
            this.Identacion=0;
            this.match("tk_class");
            if(this.post_analisis.tipo==="identificador"){
              
                this.match("identificador");
                if(this.post_analisis.tipo==="tk_llave_izq"){
                    this.match("tk_llave_izq");
                    this.appendPythonCode("class "+this.TokenL[this.Numb_post_analisis-2].lexema+" :"+"\n");
                    this.Identacion++;
                    this.LISTA_METODO_FUNCION();
                    if(this.post_analisis.tipo==="tk_llave_der"){
                        this.match("tk_llave_der");
                    }
                }
            
            }  
        }else if(this.post_analisis.tipo==="tk_interface"){
            this.Identacion=0;
            this.match("tk_interface");
            if(this.post_analisis.tipo==="identificador"){
                this.match("identificador");
                if(this.post_analisis.tipo==="tk_llave_izq"){
                    this.match("tk_llave_izq");
                    this.appendPythonCode("class "+this.TokenL[this.Numb_post_analisis-2].lexema+" :"+"\n");
                    this.Identacion++;
                    this.LISTA_METODO_FUNCION();
                    if(this.post_analisis.tipo==="tk_llave_der"){
                        this.match("tk_llave_der");
                    }
                }
            }  
        }else{
            
        }
            
        
    }
    LISTA_METODO_FUNCION(){
        this.SUB_INSTRUCCION();
        
    }
    SUB_INSTRUCCION(){
        if(this.post_analisis.tipo==="tk_public"){
            this.match("tk_public");
            this.METODO_FUNCION();
           
        }else{
            
            this.DECLARACION();
        }
    }
    METODO_FUNCION(){
        if(this.post_analisis.tipo==="tk_void"){
            this.match("tk_void");
            if(this.post_analisis.tipo=="identificador"){
                this.match("identificador");
                if(this.post_analisis.tipo==="tk_par_izq"){
                    this.match("tk_par_izq");
                    this.appendPythonCode(this.tabulador(this.Identacion)+"def "+this.TokenL[this.Numb_post_analisis-2].lexema+"(");
                    this.PARAMETROS_METODO_FUNCION();
                    if(this.post_analisis.tipo==="tk_par_der"){
                        this.match("tk_par_der");
                        this.appendPythonCode("):\n");
                        if(this.post_analisis.tipo==="tk_llave_izq"){
                            this.match("tk_llave_izq");
                            this.Identacion++;
                            this.LISTA_SENTENCIAS();
                            if(this.post_analisis.tipo==="tk_llave_der"){
                                this.match("tk_llave_der");
                                this.SUB_INSTRUCCION();
                                this.Identacion--;
                            }
                        }
                    }
                }
            }    
        }else if(this.post_analisis.tipo=="tk_static"){
            this.match("tk_static");
            if(this.post_analisis.tipo=="tk_void"){
                this.match("tk_void");
                if(this.post_analisis.tipo=="tk_main"){
                    this.match("tk_main");
                    if(this.post_analisis.tipo=="tk_main"){
                        this.match("tk_par_izq");
                        if(this.post_analisis.tipo=="tk_String"){
                            this.match("tk_String");
                            if(this.post_analisis.tipo=="tk_cor_izq"){
                                this.match("tk_cor_izq");
                                if(this.post_analisis==="tk_cor_der"){
                                    this.match("tk_cor_der");
                                    if(this.post_analisis==="tk_args"){
                                        this.match("tk_args");
                                        if(this.post_analisis==="tk_par_der"){
                                            this.match("tk_par_der");
                                            if(this.post_analisis==="tk_llave_izq"){
                                                this.match("tk_llave_izq");
                                                this.Identacion++;
                                                this.LISTA_SENTENCIAS();
                                                if(this.post_analisis==="tk_llave_der"){
                                                    this.match("tk_llave_der");
                                                    this.appendPythonCode(this.tabulador(this.Identacion)+"def "+this.TokenL[this.Numb_post_analisis-2].lexema+"(");
                                                    this.SUB_INSTRUCCION();
                                                    this.Identacion--;
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            
            
            
           
           
            
           
           
            
           
            
        
        }else{
            console.log("entroooooo");
            this.TIPO_DATO();
            this.match("identificador");
            this.match("tk_par_izq");
            this.PARAMETROS_METODO_FUNCION();
            this.match("tk_par_der");
            this.match("tk_llave_izq");
            this.LISTA_SENTENCIAS();
            this.SENTENCIA_RETURN();
            this.match("tk_llave_der");
           
            ////this.LISTA_METODO_FUNCION();
            this.SUB_INSTRUCCION();
        }
    }
           /* this.match("tk_public");
            //si es metodo
            
        
        
    }
    /*SENTENCIAS */

    LISTA_SENTENCIAS(){
        this.SENTENCIAS();
    }

    SENTENCIAS(){
        
        if(this.post_analisis.tipo==="tk_System"){
            console.log("ENTRO AQUI");
            this.match("tk_System");
            this.match("tk_punto")
            console.log("AQUI SIGUE");
            this.match("tk_out");
            this.match("tk_punto");
            this.SENTENCIA_IMPRIMIR();
            this.match("tk_par_izq");
            this.EXPRESION_NUMERICA();
            this.match("tk_par_der");
            this.match("tk_punto_coma");
            this.LISTA_SENTENCIAS();
        }else if(this.post_analisis.tipo==="tk_while"){
            this.match("tk_while");
            this.match("tk_par_izq");
            this.EXPRESION_LOGICA();
            this.match("tk_par_der");
            this.match("tk_llave_izq");
            this.LISTA_SENTENCIAS();
            this.match("tk_llave_der");
            this.LISTA_SENTENCIAS();
        }else if(this.post_analisis.tipo==="tk_do"){
            this.match("tk_do");
            this.match("tk_llave_izq");
            this.LISTA_SENTENCIAS();
            this.match("tk_llave_der");
            this.match("tk_while");
            this.match("tk_par_izq");
            this.EXPRESION_LOGICA();
            this.match("tk_par_der");
            this.match("tk_punto_coma");
            this.LISTA_SENTENCIAS();
        }else if(this.post_analisis.tipo==="tk_if"){
            this.match("tk_if");
            this.match("tk_par_izq");
            this.EXPRESION_LOGICA();
            this.match("tk_par_der");
            this.match("tk_llave_izq");
            this.LISTA_SENTENCIAS();
            this.match("tk_llave_der");
            this.SENTENCIA_IF();
            this.LISTA_SENTENCIAS();

        }else if(this.post_analisis.tipo==="identificador"){
            console.log("analizoooo");
            this.match("identificador");
            this.match("tk_par_izq");
            this.LLAMADA_PARAMETRO();
            this.match("tk_punto_coma");
            this.LISTA_SENTENCIAS();
        }
            
        
    }

    SENTENCIA_IMPRIMIR(){
        if(this.post_analisis.tipo==="tk_println"){
            this.match("tk_println");

        }else{
            this.match("tk_print");
        }
    }


    SENTENCIA_IF(){
        if (this.post_analisis.tipo==="tk_else") {
            this.match("tk_else");
            this.SUB_SENTENCIA_IF();
        }
    }

    SUB_SENTENCIA_IF(){
        if(this.post_analisis.tipo==="tk_llave_izq"){
            this.match("tk_llave_izq");
            this.SUB_INSTRUCCION();
            this.match("tk_llave_der");
            this.SENTENCIA_IF();
        }else{
            this.match("tk_if");
            this.match("tk_par_izq");
            this.EXPRESION_LOGICA();
            this.match("tk_par_der");
            this.match("tk_llave_izq");
            this.LISTA_SENTENCIAS();
            this.match("tk_llave_der");
            this.SENTENCIA_IF();

        }
    }

    /*DECLARACION */
    DECLARACION() {
        if(this.post_analisis.tipo==="identificador"){
            this.match("identificador");
            this.DECLARAR_V_2();
            this.match("tk_punto_coma");
            this.SUB_INSTRUCCION();
        }else if(this.post_analisis.tipo=="tk_int"){
            this.match("tk_int");
            this.match("identificador");
            this.LISTA_VARIABLES();
            this.DECLARAR_V();
            this.SUB_INSTRUCCION();
        }else if(this.post_analisis.tipo=="tk_double"){
            this.match("tk_double");
            this.match("identificador");
            this.LISTA_VARIABLES();
            this.DECLARAR_V();
            this.SUB_INSTRUCCION();
        }else if(this.post_analisis.tipo=="tk_string"){
            this.match("tk_string");
            this.match("identificador");
            this.LISTA_VARIABLES();
            this.DECLARAR_V();
            this.SUB_INSTRUCCION();
        }else if(this.post_analisis.tipo=="tk_boolean"){
            this.match("tk_boolean");
            this.match("identificador");
            this.LISTA_VARIABLES();
            this.DECLARAR_V();
            this.SUB_INSTRUCCION();
        }else if(this.post_analisis.tipo=="tk_char"){
            this.match("tk_char");
            this.match("identificador");
            this.LISTA_VARIABLES();
            this.DECLARAR_V();
            this.SUB_INSTRUCCION();
        }
            

        
    }

   

    DECLARAR_V(){
        if (this.post_analisis.tipo==="tk_punto_coma") {
            this.match("tk_punto_coma");
        } else {
            this.match("tk_igual");
            this.EXPRESION_NUMERICA();
            this.match("tk_punto_coma")
        }
    }

    DECLARAR_V_2(){
        if (this.post_analisis.tipo==="tk_igual") {
            this.match("tk_igual");
            this.EXPRESION_NUMERICA();
        }else if(this.post_analisis.tipo==="tk_mas"){
            this.match("tk_mas");
            this.match("tk_mas");
        }else{
            this.match("tk_menos");
            this.match("tk_menos");
        }
    }

    
    LLAMADA_PARAMETRO(){
        if (this.post_analisis.tipo==="tk_par_der") {
            this.match("tk_par_der");
        } else {
            this.EXPRESION_NUMERICA();
            this.LISTA_LLAMADA_PARAMETRO();
        }
    }

    LISTA_LLAMADA_PARAMETRO(){
        if(this.post_analisis.tipo==="tk_coma"){
            this.match("tk_match");
            this.EXPRESION_NUMERICA();
        }
    }

    LISTA_VARIABLES(){
        if (this.post_analisis.tipo==="tk_coma") {
            this.match("tk_coma");
            this.match("identificador");
            this.LISTA_VARIABLES();
        }
    }

    /*PARAMETROS_METODO_FUNCION */
    PARAMETROS_METODO_FUNCION(){
       
        if(this.post_analisis.tipo=="tk_int"){
            //TIPO_DATO
            this.match("tk_int");
            if(this.post_analisis.tipo=="identificador"){
                this.match("identificador");
                this.appendPythonCode(this.TokenL[this.Numb_post_analisis-1].lexema);
                this.L_PARAMETROS_METODO_FUNCION();
            }
            
        }else if(this.post_analisis.tipo=="tk_double"){
            //TIPO_DATO
            this.match("tk_double");
            if(this.post_analisis.tipo=="identificador"){
                this.match("identificador");
                this.appendPythonCode(this.TokenL[this.Numb_post_analisis-1].lexema);
                this.L_PARAMETROS_METODO_FUNCION();
            }
        }else if(this.post_analisis.tipo=="tk_string"){
            ///TIPO_DATO
            this.match("tk_string");
            if(this.post_analisis.tipo=="identificador"){
                this.match("identificador");
                this.appendPythonCode(this.TokenL[this.Numb_post_analisis-1].lexema);
                this.L_PARAMETROS_METODO_FUNCION();
            }
        }else if(this.post_analisis.tipo=="tk_boolean"){
            //TIPO_DATO
            this.match("tk_boolean");
            if(this.post_analisis.tipo=="identificador"){
                this.match("identificador");
                this.appendPythonCode(this.TokenL[this.Numb_post_analisis-1].lexema);
                this.L_PARAMETROS_METODO_FUNCION();
            }
        }else if(this.post_analisis.tipo=="tk_char"){
            ///TIPO_DATO
            this.match("tk_char");
            if(this.post_analisis.tipo=="identificador"){
                this.match("identificador");
                this.appendPythonCode(this.TokenL[this.Numb_post_analisis-1].lexema);
                this.L_PARAMETROS_METODO_FUNCION();
            }
        }
        
       
    }

    L_PARAMETROS_METODO_FUNCION (){
        if(this.post_analisis.tipo==="tk_coma"){
            this.match("tk_coma");
            this.TIPO_DATO();
            if(this.post_analisis.tipo==="identificador"){
                this.match("identificador");
                this.appendPythonCode(","+this.TokenL[this.Numb_post_analisis-1].lexema);
                this.L_PARAMETROS_METODO_FUNCION();
            }
            
        }
    }

    
    /*EXPRESIONES LOGICAS */

    EXPRESION_LOGICA(){
        this.EXPRESION_RELACIONAL();
        this.EP();
    }

    EP(){
        if (this.post_analisis.tipo=="tk_and") {
            this.match("tk_and");
            this.EXPRESION_RELACIONAL();
            this.EP();
        }else if(this.post_analisis.tipo=="tk_or"){
            this.match("tk_or");
            this.EXPRESION_RELACIONAL();
            this.EP();
        }else if(this.post_analisis.tipo=="tk_not"){
            this.match("tk_not"); 
            this.EXPRESION_RELACIONAL();
        }
    }


    /*EXPRESION RELACIONAL */

    EXPRESION_RELACIONAL(){
        this.EXPRESION_NUMERICA();
        this.TP();
    }

    TP(){
       if (this.post_analisis.tipo=="tk_mayor") {
           this.match("tk_mayor");
           this.EXPRESION_NUMERICA();
           this.TP();
       }else if(this.post_analisis.tipo=="tk_menor"){
            this.match("tk_menor");
            this.EXPRESION_NUMERICA();
            this.TP();
       }else if(this.post_analisis.tipo=="tk_menor_igual"){
            this.match("tk_menor_igual");
            this.EXPRESION_NUMERICA();
            this.TP();
       }else if(this.post_analisis.tipo=="tk_mayor_igual"){
            this.match("tk_mayor_igual");
            this.EXPRESION_NUMERICA();
            this.TP();
       }else if(this.post_analisis.tipo=="tk_igual_igual"){
            this.match("tk_igual_igual");
            this.EXPRESION_NUMERICA();
            this.TP();
       }else if(this.post_analisis.tipo=="tk_not_igual"){
            this.match("tk_not_igual");
            this.EXPRESION_NUMERICA();
            this.TP();
       }
    }


    /*EXPRESSIONES ARITMETICAS  */

    EXPRESION_NUMERICA(){
        this.TERMINO();
        this.MAS_TERMINOS();
    }

    MAS_TERMINOS(){
        if(this.post_analisis.tipo=="tk_mas"){
            this.match("tk_mas");
            this.TERMINO();
            this.MAS_TERMINOS();
        }else if(this.post_analisis.tipo=="tk_menos"){
            this.match("tk_menos");
            this.TERMINO();
            this.MAS_TERMINOS();
        }

    }

    TERMINO(){
        this.FACTOR();
        this.MAS_FACTORES();
    }

    MAS_FACTORES(){
        if(this.post_analisis.tipo=="tk_por"){
            this.match("tk_por");
            this.FACTOR();
            this.MAS_FACTORES();
        }else if(this.post_analisis.tipo=="tk_dividido"){
            this.match("tk_dividido");
            this.FACTOR();
            this.MAS_FACTORES();
        }
    }
    
    FACTOR(){
        this.PRIMARIO();
        this.EXP();
    }

    EXP(){
        if (this.post_analisis.tipo=="tk_xor") {
            this.match("tk_xor");
            this.FACTOR(); 
        }
    }
    
    PRIMARIO(){
        if (this.post_analisis.tipo=="tk_menos") {
            this.match("tk_menos");
            this.PRIMARIO();
        }else{
            this.ELEMENTO();
        }
    }
    
    ELEMENTO(){
        if (this.post_analisis.tipo=="tk_par_izq") {
            this.match("tk_par_izq");
            this.EXPRESION_NUMERICA();
            this.match("tk_par_der");
        }else if(this.post_analisis.tipo=="identificador"){
            this.match("identificador");
        }else if(this.post_analisis.tipo=="caracter"){
            this.match("caracter");
        }else if(this.post_analisis.tipo=="entero"){
            this.match("entero");
        }else if(this.post_analisis.tipo=="decimal"){
            this.match("decimal");
        }else if(this.post_analisis.tipo=="cadena"){
            this.match("cadena");
        }
    }

    /*SENTENCIAS RETURN */
    SENTENCIA_RETURN(){
        if(this.post_analisis.tipo=="tk_return"){
            this.match("tk_return");
            this.EXPRESION_NUMERICA();
            this.match("tk_punto_coma");
            
        }
    }

    /*TIPO DATOS */

    TIPO_DATO(){
        if(this.post_analisis.tipo=="tk_int"){
            this.match("tk_int");
        }else if(this.post_analisis.tipo=="tk_double"){
            this.match("tk_double");
        }else if(this.post_analisis.tipo=="tk_string"){
            this.match("tk_string");
        }else if(this.post_analisis.tipo=="tk_boolean"){
            this.match("tk_boolean");
        }else if(this.post_analisis.tipo=="tk_char"){
            this.match("tk_char");
        }
    }


    SENTENCIA_COMENTARIO(){
        this.match("tk_comentario_simple");
            this.appendPythonCode("#"+this.TokenL[this.Numb_post_analisis-1].lexema+"\n");
        
        
    }


    match(tipo){
        if (tipo!= this.post_analisis.tipo) {
            
            if (this.Numb_post_analisis < this.TokenL.length ) {
                console.log("ERROR Sintactico en:"+ this.post_analisis.tipo+" se esperaba: "+ tipo);
                this.panicMode(this.Numb_post_analisis);
            }
        }

        if(this.post_analisis.tipo!="Ultimo"){
            this.Numb_post_analisis++;
            if(this.Numb_post_analisis < this.TokenL.length-1){
                this.post_analisis = this.TokenL[this.Numb_post_analisis];
            }
        }
    }

    appendPythonCode(codeString){
        this.PyhtonCode=this.PyhtonCode+codeString;
    }
    
    panicMode(counter){
        if (counter < this.TokenL.length-1) {
            let temp = this.post_analisis;
            temp = this.TokenL[counter];
            while (counter < this.TokenL.length) {
                if(temp.tipo==="tk_llave_der"){
                        
                        this.post_analisis = temp;
                        this.Numb_post_analisis = counter;
                        this.match("tk_llave_der");
                        break;
                }
                counter += 1;
                temp = this.TokenL[counter];
            }
        }
    }

    //REGRESA UN STRING CON n TABULACIONES
    tabulador(n){
    
        if (n==0){
        return "";
        }
        var aux = "";
        for (var i = 0; i < n; i++){
            aux = aux + "\t";
        }
        return aux;
    }
    

}
module.exports=Manual_Parser;