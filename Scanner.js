
let Token = require('./Token.js');
class Scanner{
    constructor(){
        this.Token_Lista=[];
        
    }

    Scanner_Lex(data_text){
        let columna=0;
        let fila=0;
        let AscciCode=0;
        let cadena;
        let Auxiliar_lex="";
        let Estado=0;
        data_text= data_text+"#"
        for (let i = 0; i < data_text.length-1; i++) {
            cadena=data_text.charAt(i);
            AscciCode=cadena.charCodeAt(0);
            switch (Estado) {
                case 0:
                    if (AscciCode===59) {//;
                        Auxiliar_lex+=cadena;
                        Estado=1; 
                        columna++;  
                    } else if(AscciCode===40){//(
                        Auxiliar_lex+=cadena;
                        Estado=2;
                        columna++;
                    } else if(AscciCode===41){//)
                        Auxiliar_lex+=cadena;
                        Estado=3;
                        columna++;
                    } else if(AscciCode===91){//[
                        Auxiliar_lex+=cadena;
                        Estado=4;
                        columna++;
                    } else if(AscciCode===93){//]
                        Auxiliar_lex+=cadena;
                        Estado=5;
                        columna++;
                    } else if(AscciCode===123){//{
                        Auxiliar_lex+=cadena;
                        Estado=6;
                        columna++;
                    } else if(AscciCode===125){//}
                        Auxiliar_lex+=cadena;
                        Estado=7;
                        columna++;
                    } else if(AscciCode===44){//,
                        Auxiliar_lex+=cadena;
                        Estado=8;
                        columna++;
                    } else if(AscciCode===46){//.
                        Auxiliar_lex+=cadena;
                        Estado=9;
                        columna++;
                    } else if(AscciCode===94){//^
                        Auxiliar_lex+=cadena;
                        Estado=10;
                        columna++;
                    } else if(AscciCode===43){//+
                        Auxiliar_lex+=cadena;
                        Estado=11;
                        columna++;
                    } else if(AscciCode===45){//-
                        Auxiliar_lex+=cadena;
                        Estado=12;
                        columna++;
                    } else if(AscciCode===42){//*
                        Auxiliar_lex+=cadena;
                        Estado=13;
                        columna++;
                    } else if(AscciCode===47){// /
                        Auxiliar_lex+=cadena;
                        Estado=14;
                        columna++;
                    }else if(AscciCode===60){// <
                        Auxiliar_lex+=cadena;
                        Estado=17;
                        columna++;
                    }else if(AscciCode===62){// >
                        Auxiliar_lex+=cadena;
                        Estado=19;
                        columna++;
                    }else if(AscciCode===38){// &
                        Auxiliar_lex+=cadena;
                        Estado=21;
                        columna++;
                    }else if(AscciCode===124){// |
                        Auxiliar_lex+=cadena;
                        Estado=21;
                        columna++;
                    }else if(AscciCode===61){// =
                        Auxiliar_lex+=cadena;
                        Estado=25;
                        columna++;
                    }else if(AscciCode===33){// !
                        Auxiliar_lex+=cadena;
                        Estado=27;
                        columna++;
                    }else if((AscciCode>= 65 && AscciCode<=90)||(AscciCode>= 97 && AscciCode<=122)){ // LETRA
                        Auxiliar_lex+=cadena;
                        Estado=29;
                        columna++;
                    }else if(AscciCode>=48 && AscciCode<=57){//NUMBER
                        Auxiliar_lex+=cadena;
                        Estado=30;
                        columna++;
                    }else if(AscciCode===34){// "   
                        Auxiliar_lex+=cadena;
                        Estado=32;
                        columna++;   
                    }else if(AscciCode===39){ // '
                        Auxiliar_lex+=cadena;
                        Estado=34;
                        columna++;
                    }else{
                        if(AscciCode>=0 && AscciCode <=32 && AscciCode!=10 ){
                            
                        }else if(AscciCode===10){
                            fila++;
                            columna=0;
                            
                        }else{
                            console.log("error lexico con"+" "+cadena);
                            Estado=0;
                        }
                    }
                    break;
                case 1:
                    this.Token_Lista.push(new Token(fila,columna,Auxiliar_lex,"tk_punto_coma"));
                    Auxiliar_lex="";
                    i-=1;
                    Estado=0;
                    break;
                case 2:
                    this.Token_Lista.push(new Token(fila,columna,Auxiliar_lex,"tk_par_izq"));
                    Auxiliar_lex="";
                    i-=1;
                    Estado=0;
                    break;
                case 3:
                    this.Token_Lista.push(new Token(fila,columna,Auxiliar_lex,"tk_par_der"));
                    Auxiliar_lex="";
                    i-=1;
                    Estado=0;
                    break;
                case 4:
                    this.Token_Lista.push(new Token(fila,columna,Auxiliar_lex,"tk_cor_izq"));
                    Auxiliar_lex="";
                    i-=1;
                    Estado=0;
                    break;
                case 5:
                    this.Token_Lista.push(new Token(fila,columna,Auxiliar_lex,"tk_cor_der"));
                    Auxiliar_lex="";
                    i-=1;
                    Estado=0;
                    break;
                case 6:
                    this.Token_Lista.push(new Token(fila,columna,Auxiliar_lex,"tk_llave_izq"));
                    Auxiliar_lex="";
                    i-=1;
                    Estado=0;
                    break;
                case 7:
                    this.Token_Lista.push(new Token(fila,columna,Auxiliar_lex,"tk_llave_der"));
                    Auxiliar_lex="";
                    i-=1;
                    Estado=0;
                    break;
                case 8:
                    this.Token_Lista.push(new Token(fila,columna,Auxiliar_lex,"tk_coma"));
                    Auxiliar_lex="";
                    i-=1;
                    Estado=0;
                    break;
                case 9:
                    this.Token_Lista.push(new Token(fila,columna,Auxiliar_lex,"tk_punto"));
                    Auxiliar_lex="";
                    i-=1;
                    Estado=0;
                    break;
                case 10:
                    this.Token_Lista.push(new Token(fila,columna,Auxiliar_lex,"tk_xor"));
                    Auxiliar_lex="";
                    i-=1;
                    Estado=0;
                    break;
                case 11:
                    this.Token_Lista.push(new Token(fila,columna,Auxiliar_lex,"tk_mas"));
                    Auxiliar_lex="";
                    i-=1;
                    Estado=0;
                    break;
                case 12:
                    this.Token_Lista.push(new Token(fila,columna,Auxiliar_lex,"tk_menos"));
                    Auxiliar_lex="";
                    i-=1;
                    Estado=0;
                    break;
                case 13:
                    this.Token_Lista.push(new Token(fila,columna,Auxiliar_lex,"tk_por"));
                    Auxiliar_lex="";
                    i-=1;
                    Estado=0;
                    break;  
                case 14:
                    if(AscciCode===47){ // /
                        Auxiliar_lex+=cadena;
                        Estado=15;
                        columna++;
                    }else if(AscciCode===46){// * comentario multiple
                        Auxiliar_lex+=cadena;
                        Estado=36;
                        columna++;
                    }else{
                        this.Token_Lista.push(new Token(fila,columna,Auxiliar_lex,"tk_dividido"));
                        Auxiliar_lex="";
                        i-=1;
                        Estado=0;
                        break;  
                    }
                case 15:
                    if(AscciCode===10){// /n
                        Auxiliar_lex+=cadena;
                        Estado=16;
                        columna=0;
                        fila++;
                    }else{
                        Auxiliar_lex+=cadena;
                        Estado=15;
                        columna++;
                    }
                    break;
                case 16:
                    this.Token_Lista.push(new Token(fila,columna,Auxiliar_lex,"tk_comentario_simple"));
                    Auxiliar_lex="";
                    i-=1;
                    Estado=0;
                    break;
                case 17:
                    if(AscciCode===61){// =
                        Auxiliar_lex+=cadena;
                        Estado=18;
                        columna++;
                    }else{
                        this.Token_Lista.push(new Token(fila,columna,Auxiliar_lex,"tk_menor"));
                        Auxiliar_lex="";
                        i-=1;
                        Estado=0;
                        break;  
                    }
                case 18:
                    this.Token_Lista.push(new Token(fila,columna,Auxiliar_lex,"tk_menor_igual"));
                    Auxiliar_lex="";
                    i-=1;
                    Estado=0;
                    break; 
                case 19:
                    if(AscciCode===61){// =
                        Auxiliar_lex+=cadena;
                        Estado=20;
                        columna++;
                    }else{
                        this.Token_Lista.push(new Token(fila,columna,Auxiliar_lex,"tk_mayor"));
                        Auxiliar_lex="";
                        i-=1;
                        Estado=0;
                        
                    } 
                    break;  
                case 20:
                    this.Token_Lista.push(new Token(fila,columna,Auxiliar_lex,"tk_mayor_igual"));
                    Auxiliar_lex="";
                    i-=1;
                    Estado=0;
                    break; 
                case 21:
                    if(AscciCode===38){// &
                        Auxiliar_lex+=cadena;
                        Estado=22;
                        columna++;
                    }else{
                        console.log("ERROR");
                        Estado=0;
                          
                    } 
                    break;
                case 22:
                    this.Token_Lista.push(new Token(fila,columna,Auxiliar_lex,"tk_and"));
                    Auxiliar_lex="";
                    i-=1;
                    Estado=0;
                    break; 
                case 23:
                    if(AscciCode===124){// |
                        Auxiliar_lex+=cadena;
                        Estado=24;
                        columna++;
                    }else{
                        console.log("ERROR");
                        Estado=0;
                          
                    } 
                    break;
                case 24:
                    this.Token_Lista.push(new Token(fila,columna,Auxiliar_lex,"tk_or"));
                    Auxiliar_lex="";
                    i-=1;
                    Estado=0;
                    break;
                case 25:
                    if (AscciCode==61) {// =
                        Auxiliar_lex+=cadena;
                        Estado=26;
                        columna++;
                    } else {
                        this.Token_Lista.push(new Token(fila,columna,Auxiliar_lex,"tk_igual"));
                        Auxiliar_lex="";
                        i-=1;
                        Estado=0;
                    }
                    break;
                case 26:
                    this.Token_Lista.push(new Token(fila,columna,Auxiliar_lex,"tk_igual_igual"));
                    Auxiliar_lex="";
                    i-=1;
                    Estado=0;
                    break;
                case 27:
                    if (AscciCode==61) {// =
                        Auxiliar_lex+=cadena;
                        Estado=28;
                        columna++;
                    } else {
                        this.Token_Lista.push(new Token(fila,columna,Auxiliar_lex,"tk_not"));
                        Auxiliar_lex="";
                        i-=1;
                        Estado=0;
                    }
                    break;
                case 28:
                    this.Token_Lista.push(new Token(fila,columna,Auxiliar_lex,"tk_not_igual"));
                    Auxiliar_lex="";
                    i-=1;
                    Estado=0;
                    break;
                case 29:
                    if ((AscciCode>= 65 && AscciCode<=90)||(AscciCode>= 97 && AscciCode<=122)) { // letra
                        Auxiliar_lex+=cadena;
                        Estado=29;
                        columna++;
                    } else if(AscciCode>=48 && AscciCode<=57) {//numero
                        Auxiliar_lex+=cadena;
                        Estado=29;
                        columna++;
                    }else{
                        this.Token_Lista.push(new Token(fila,columna,Auxiliar_lex,"identificador"));
                        Auxiliar_lex="";
                        i-=1;
                        Estado=0; 
                    }
                    break;
                case 30:
                    if (AscciCode>=48 && AscciCode<=57) {//numero
                        Auxiliar_lex+=cadena;
                        Estado=30;
                        columna++;
                    } else if (AscciCode===46){//punto
                        Auxiliar_lex+=cadena;
                        Estado=31;
                        columna++;
                    }else{
                        this.Token_Lista.push(new Token(fila,columna,Auxiliar_lex,"entero"));
                        Auxiliar_lex="";
                        i-=1;
                        Estado=0;
                    }
                    break;
                case 31:
                    if (AscciCode>=48 && AscciCode<=57) {//numero
                        Auxiliar_lex+=cadena;
                        Estado=31;
                        columna++;
                    }else{
                        this.Token_Lista.push(new Token(fila,columna,Auxiliar_lex,"decimal"));
                        Auxiliar_lex="";
                        i-=1;
                        Estado=0; 
                    }
                    break;
                case 32:
                    if (AscciCode===34) {// " 
                        Auxiliar_lex+=cadena;
                        Estado=33;
                        columna++;
                    } else {
                        Auxiliar_lex+=cadena;
                        Estado=32;
                        columna++;
                    }
                    break;
                case 33:
                    this.Token_Lista.push(new Token(fila,columna,Auxiliar_lex,"cadena"));
                    Auxiliar_lex="";
                    i-=1;
                    Estado=0;
                    break;
                case 34:
                    if (AscciCode===39) {// ' 
                        Auxiliar_lex+=cadena;
                        Estado=35;
                        columna++;
                    } else {
                        Auxiliar_lex+=cadena;
                        Estado=34;
                        columna++;
                    }
                    break;
                case 35:
                    this.Token_Lista.push(new Token(fila,columna,Auxiliar_lex,"caracter"));
                    Auxiliar_lex="";
                    i-=1;
                    Estado=0;
                    break;
                case 36:
                    if(AscciCode===46){// *
                        Auxiliar_lex+=cadena;
                        Estado=37;
                        columna++;
                    }else{
                        if(AscciCode===10){
                            Auxiliar_lex+=cadena;
                            Estado=36;
                            columna=0;
                            fila++;
                        }else{
                            Auxiliar_lex+=cadena;
                            Estado=36;
                            columna++;
                        }
                        
                    } 
                    break;
                case 37:
                    if (AscciCode===47) { //  /
                        Auxiliar_lex+=cadena;
                        Estado=38;
                        columna++;
                    } else {
                        Auxiliar_lex+=cadena;
                        Estado=36;
                        columna++;
                    }
                    break;
                case 38:
                    this.Token_Lista.push(new Token(fila,columna,Auxiliar_lex,"comentario multilinea"));
                    Auxiliar_lex="";
                    i-=1;
                    Estado=0;
                    break;
                default:
                    break;
            }
        }
        this.imprimir_Token(this.Token_Lista)
    }

    imprimir_Token(Token_Lista){
        let temp = new Token();
        for (let index = 0; index < Token_Lista.length; index++) {
            temp = Token_Lista[index];
            console.log("Token "+temp.lexema+ "-->"+ "Tipo: "+ temp.tipo);
            
        }

    }

}



module.exports=Scanner;
/******************************-/* */