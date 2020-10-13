var fs = require('fs');
const Nodo_Arbol = require('./AstTree.js');
var parser = require('./gramatica.js');
var tree_ast= require('./recorrer_nodo');

/*function ejecutar(texto){
    try{
     
        //console.log(data_parser);
    }catch(err){
        console.log(err);
    }
}*/

fs.readFile('test.java', 'utf8',function(err,data){
    var raiz = new tree_ast();
    console.log(raiz.recorrer_arbol(parser.parse(data.toString())));
});