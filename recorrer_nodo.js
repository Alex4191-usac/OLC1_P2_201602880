var id_n=1;
class Recorrer_nodo{
    
    recorrer_arbol(nodo){
        var concatena;
        if(nodo.id==0){
            nodo.id=id_n;
            id_n++;
        }
        console.log(nodo.id + ' [label= "'+ nodo.valor +'" fillcolor="#d62728" shape="circle"];');
            nodo.hijos.forEach(element => {
                console.log(nodo.id+'->'+ id_n +";");
                concatena+=this.recorrer_arbol(element);
            });
        return concatena;
    }
}
module.exports= Recorrer_nodo;