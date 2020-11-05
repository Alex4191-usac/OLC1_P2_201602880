var express = require('express');
let app = express();
let cors = require('cors');
const bodyParser = require('body-parser');
const morgan = require('morgan');

/*PARSER */
let gramaticaJISON = require('./gramatica.js');
let recorrido_ARBOL = require('./recorrer_nodo.js');
const { text } = require('body-parser');

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
    console.log(string_ast); 
   //res.send(JSON.stringify( JsonGrammar.lista_error ));
   //es.send(JSON.stringify( {Saludo: "Bienvenidos a " + "holi"} ));
   res.send(JSON.stringify( {Saludo: string_ast} ));



    
});
// app.use('/api/parser', require('./rutas/parser'));






app.listen(port,ip, async () => {
    console.log('IP: %s PORT: %d', ip, port);
});