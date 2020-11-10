
var express = require('express');
let serv = express();
let cors = require('cors');
const bodyParser = require('body-parser');
const morgan = require('morgan');



const { text } = require('body-parser');


/*LET CONSTANSTS */
let lexico = require('./Scanner.js');


let textA="";

serv.use(bodyParser.json());
serv.use(cors());

const ip   = process.env.JS_IP || "182.18.7.8";
const port = process.env.JS_PORT || 3002;


serv.use(morgan('dev'));
serv.use(express.urlencoded({extended: false}));
serv.use(express.json());


serv.post('/Traductor2/', function (req, res) {
    console.log("peticion rest a JSPARSER");
    //console.log(req.body.Nombre.toString());
    // var datos = req.body.Nombre.toString();

    // let l = new lexico();
    // let lista_tokens = l.Scanner_Lex(datos);
    // console.log("aca va la lista de tokens");
    // console.log(lista_tokens.Token_Lista);

    res.send(JSON.stringify( {Saludito: "entro un saludito prron pa todos mis hijos y hermanos ayayayyayyayya si saleeeeeeeeeeeeeeee"} ));
    console.log("Analisis realizado con exito")
    
});



serv.listen(port,ip, async () => {
    console.log('IP: %s PORT: %d', ip, port);
});
/*function ejecutar(texto){
    try{
     
        //console.log(data_parser);
    }catch(err){
        console.log(err);
    }
}*/

// // fs.readFile('test.java', 'utf8',function(err,data){
//     //let raiz = new tree_ast();
//     let scanlex = new scanner2();
//     let parserlex = new parser_lex();
//     //let arbolAST = parser.parse(data.toString())
//     //console.log(raiz.recorrer_arbol(arbolAST));
//     //console.log(parser_Js.parse(data.toString()));
//     scanlex.Scanner_Lex(data);
//     parserlex.LL_Parser(scanlex.Token_Lista);
//     //parser_lex.(scanlex.Token_Lista);
    
//     //parser_lex(scanlex.Token_Lista);
    

// });