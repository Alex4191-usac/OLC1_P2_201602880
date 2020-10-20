let id_n=1;
let concatena="";
class Recorrer_nodo{
    
    recorrer_arbol(nodo){
        
       if(nodo!=undefined ){
        
        if(nodo.id==0){
            nodo.id=id_n;
            id_n++;
        }
        
            concatena+=nodo.id + ' [label= "'+ nodo.valor +'" fillcolor="#d62728" shape="circle"];\n';
        
        
        if(nodo.hijos!=undefined){
            nodo.hijos.forEach(element => {
                concatena+=nodo.id+'->'+ id_n +";\n";
                this.recorrer_arbol(element);
            });
        }   
        return concatena;
        }
    }
}
module.exports= Recorrer_nodo;