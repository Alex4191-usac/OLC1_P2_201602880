var fs = require('fs');
var parser = require('./gramatica.js');

fs.readFile('./test.java', (err, data) =>{
    if (err) throw err;
    parser.parse(data.toString());
});