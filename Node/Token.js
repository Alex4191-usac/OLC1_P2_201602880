
class Token{
    constructor(fila,columna,lexema,tipo,correlativo){
        this.fila=fila;
        this.columna=columna;
        this.lexema=lexema;
        this.tipo=tipo;
        this.correlativo=correlativo;
    }

    getFila(){
        this.fila;
    }

    getColumna(){
        this.columna;
    }

    getLexema(){
        this.lexema;
    }
    
    getTipo(){
        this.tipo;
    }
    
    getCorrelativo(){
        this.correlativo;
    }
}

module.exports=Token;