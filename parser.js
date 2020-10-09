var fs = require('fs');
var parser = require('./gramatica.js');

function ejecutar(texto){
    try{
        let data_parser=parser.parse(texto);
        console.log(data_parser);
    }catch(err){
        console.log(err);
    }
}

fs.readFile('test.java', 'utf8',function(err,data){
    ejecutar(data);
    console.log("PARSER FINALIZADO");
});