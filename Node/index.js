var express = require('express');
let app = express();
let cors = require('cors');
const bodyParser = require('body-parser');
const morgan = require('morgan');

/*PARSER */
let gramaticaJISON = require('./gramatica.js');
let recorrido_ARBOL = require('./recorrer_nodo.js');
let token = require('./Token');

const { text } = require('body-parser');
const Token = require('./Token');

let textA="";

app.use(bodyParser.json());
app.use(cors());

const ip   = process.env.NODEJS_IP || "182.18.7.7";
const port = process.env.NODEJS_PORT || 3001;


app.use(morgan('dev'));
app.use(express.urlencoded({extended: false}));
app.use(express.json());


app.post('/Curso/', function (req, res) {
    var datos = req.body.Nombre.toString();
    console.log(datos.length);
    let JsonGrammar = gramaticaJISON.parse(datos);
    let raiz = new recorrido_ARBOL();
    let string_ast =raiz.recorrer_arbol(JsonGrammar.ast);
    

    

    let body_table_report = String_table(JsonGrammar.lista_token);
    
    res.send(JSON.stringify( {Saludo: string_ast, Saludo2:body_table_report,ListaErrores:JsonGrammar.lista_error} ));


});
// app.use('/api/parser', require('./rutas/parser'));

function String_table (TokenObject){
    let body_table = "{"+'"'+`tokens`+'"'+":[";
    let count = 0;
    Token_tmp = new Token();
    for (const key in TokenObject) {
        if (TokenObject.hasOwnProperty(key)) {
            Token_tmp = TokenObject[key];
            if(count===TokenObject.length-1){
                body_table+=
                `{`+`"`+`fila`+`"`+`:`+`"`+Token_tmp.fila+`"`+`,`+
                `"`+`columna`+`"`+`:`+`"`+Token_tmp.columna+`"`+`,`+
                `"`+`lexema`+`"`+`:`+`"`+Token_tmp.lexema+`"`+`,`+
                `"`+`tipo`+`"`+`:`+`"`+Token_tmp.tipo+`"`+`,`+
                `"`+`correlativo`+`"`+`:`+`"`+Token_tmp.correlativo+`"`+`}`
            }else{
                body_table+=
                `{`+`"`+`fila`+`"`+`:`+`"`+Token_tmp.fila+`"`+`,`+
                `"`+`columna`+`"`+`:`+`"`+Token_tmp.columna+`"`+`,`+
                `"`+`lexema`+`"`+`:`+`"`+Token_tmp.lexema+`"`+`,`+
                `"`+`tipo`+`"`+`:`+`"`+Token_tmp.tipo+`"`+`,`+
                `"`+`correlativo`+`"`+`:`+`"`+Token_tmp.correlativo+`"`+`},`
            }
        }
        count++;
    }
    return body_table+`]}`;
}


app.listen(port,ip, async () => {
    console.log('IP: %s PORT: %d', ip, port);
});