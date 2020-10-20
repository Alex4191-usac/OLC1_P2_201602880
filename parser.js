let fs = require('fs');
const Nodo_Arbol = require('./AstTree.js');
let parser = require('./gramatica.js');
let tree_ast= require('./recorrer_nodo');
let Traductor= require('./G_JS');
let scanner2 = require('./Scanner');
let parser_lex = require('./Manual_Parser');


/*function ejecutar(texto){
    try{
     
        //console.log(data_parser);
    }catch(err){
        console.log(err);
    }
}*/

fs.readFile('test.java', 'utf8',function(err,data){
    let raiz = new tree_ast();
    //let scanlex = new scanner2();
    //let parserlex = new parser_lex();
    let arbolAST = parser.parse(data.toString())
    console.log(raiz.recorrer_arbol(arbolAST));
    let Traducccion = Traductor.parse(data);
    console.log(Traducccion);
    ///scanlex.Scanner_Lex(data);
    //parserlex.LL_Parser(scanlex.Token_Lista);

});