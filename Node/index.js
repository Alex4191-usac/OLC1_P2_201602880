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
    console.log(gramaticaJISON.parse(datos));
   // console.log("romantica Style in da world");
    //let textJison = gramaticaJISON.parse(textA);
    //console.log(textJison);
    
    //Iniciar_Analisis(data_text);
    //console.log(req.body.Nombre.toString());
    res.send(JSON.stringify( {Saludo: "Bienvenidos a " + req.body.Nombre.toString()} ));
    

    
});
// app.use('/api/parser', require('./rutas/parser'));

//FUNCION ANALSIS

function Iniciar_Analisis(texto){
    if(texto!=undefined){
        
        console.log("entro a Iniciar Analisis0");
        console.log(texto.toString());
        console.log("ROMANTIC STYLE IN DA WORLD")
        console.log(texto);
        
        let analisis_Jison=gramaticaJISON.parse(texto.toString());
        console.log(analisis_Jison);
    }
}


app.listen(port,ip, async () => {
    console.log('IP: %s PORT: %d', ip, port);
});