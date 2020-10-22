let fs = require('fs');
const Nodo_Arbol = require('./AstTree.js');
let parser = require('./gramatica.js');
let tree_ast= require('./recorrer_nodo.js');
let parser_Js= require('./G_JS.js');
let scanner2 = require('./Scanner.js');
let parser_lex = require('./Manual_Parser.js');


/*function ejecutar(texto){
    try{
     
        //console.log(data_parser);
    }catch(err){
        console.log(err);
    }
}*/

fs.readFile('test.java', 'utf8',function(err,data){
    //let raiz = new tree_ast();
    let scanlex = new scanner2();
    let parserlex = new parser_lex();
    //let arbolAST = parser.parse(data.toString())
    //console.log(raiz.recorrer_arbol(arbolAST));
    //console.log(parser_Js.parse(data.toString()));
    scanlex.Scanner_Lex(data);
    parserlex.LL_Parser(scanlex.Token_Lista);
    //parser_lex.(scanlex.Token_Lista);
    
    //parser_lex(scanlex.Token_Lista);
    

});