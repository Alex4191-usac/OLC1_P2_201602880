let fs = require('fs');
const Nodo_Arbol = require('./AstTree.js');
let parser = require('./gramatica.js');
let tree_ast= require('./recorrer_nodo');
let parser2 = require('./Scanner');

/*function ejecutar(texto){
    try{
     
        //console.log(data_parser);
    }catch(err){
        console.log(err);
    }
}*/

fs.readFile('test.java', 'utf8',function(err,data){
    //let raiz = new tree_ast();
    let scanlex = new parser2();
    //console.log(raiz.recorrer_arbol(parser.parse(data.toString())));
    scanlex.Scanner_Lex(data);
});