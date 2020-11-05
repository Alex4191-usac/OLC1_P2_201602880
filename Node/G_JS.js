/* parser generated by jison 0.4.18 */
/*
  Returns a Parser object of the following structure:

  Parser: {
    yy: {}
  }

  Parser.prototype: {
    yy: {},
    trace: function(),
    symbols_: {associative list: name ==> number},
    terminals_: {associative list: number ==> name},
    productions_: [...],
    performAction: function anonymous(yytext, yyleng, yylineno, yy, yystate, $$, _$),
    table: [...],
    defaultActions: {...},
    parseError: function(str, hash),
    parse: function(input),

    lexer: {
        EOF: 1,
        parseError: function(str, hash),
        setInput: function(input),
        input: function(),
        unput: function(str),
        more: function(),
        less: function(n),
        pastInput: function(),
        upcomingInput: function(),
        showPosition: function(),
        test_match: function(regex_match_array, rule_index),
        next: function(),
        lex: function(),
        begin: function(condition),
        popState: function(),
        _currentRules: function(),
        topState: function(),
        pushState: function(condition),

        options: {
            ranges: boolean           (optional: true ==> token location info will include a .range[] member)
            flex: boolean             (optional: true ==> flex-like lexing behaviour where the rules are tested exhaustively to find the longest match)
            backtrack_lexer: boolean  (optional: true ==> lexer regexes are tested in order and for each matching regex the action code is invoked; the lexer terminates the scan when a token is returned by the action code)
        },

        performAction: function(yy, yy_, $avoiding_name_collisions, YY_START),
        rules: [...],
        conditions: {associative list: name ==> set},
    }
  }


  token location info (@$, _$, etc.): {
    first_line: n,
    last_line: n,
    first_column: n,
    last_column: n,
    range: [start_number, end_number]       (where the numbers are indexes into the input string, regular zero-based)
  }


  the parseError function receives a 'hash' object with these members for lexer and parser errors: {
    text:        (matched text)
    token:       (the produced terminal token, if any)
    line:        (yylineno)
  }
  while parser (grammar) errors will also provide these members, i.e. parser errors deliver a superset of attributes: {
    loc:         (yylloc)
    expected:    (string describing the set of expected tokens)
    recoverable: (boolean: TRUE when the parser has a error recovery rule available for this particular error)
  }
*/
var G_JS = (function(){
var o=function(k,v,o,l){for(o=o||{},l=k.length;l--;o[k[l]]=v);return o},$V0=[1,4],$V1=[1,5],$V2=[1,6],$V3=[5,7,15,16],$V4=[1,17],$V5=[1,23],$V6=[1,18],$V7=[1,19],$V8=[1,26],$V9=[1,24],$Va=[1,25],$Vb=[1,27],$Vc=[1,28],$Vd=[1,31],$Ve=[7,9,12,15,16,28,76,77,78,79],$Vf=[1,40],$Vg=[52,55],$Vh=[2,42],$Vi=[1,41],$Vj=[1,42],$Vk=[9,19,54,72,73,74,75],$Vl=[9,12],$Vm=[1,45],$Vn=[25,52,55],$Vo=[1,58],$Vp=[1,53],$Vq=[1,52],$Vr=[1,54],$Vs=[1,55],$Vt=[1,56],$Vu=[1,57],$Vv=[7,9,12,15,16,19,28,35,39,40,43,49,54,62,72,73,74,75,76,77,78,79,80,81,82],$Vw=[1,69],$Vx=[1,70],$Vy=[1,71],$Vz=[1,72],$VA=[1,73],$VB=[21,25,53,54,55,60,61,63,64,65,66,67,68,69,70,71],$VC=[2,45],$VD=[21,25,53,54,55,60,61,63,64,65,66,67,68],$VE=[21,25,53,54,55,60,61,63,64,65,66,67,68,69,70],$VF=[9,12,15,16,28,35,39,40,43,49,76,77,78,79,80,81,82],$VG=[21,55],$VH=[1,116],$VI=[1,114],$VJ=[1,115],$VK=[1,109],$VL=[1,110],$VM=[1,111],$VN=[1,118],$VO=[1,117],$VP=[1,138],$VQ=[21,25],$VR=[21,25,60,61],$VS=[2,86],$VT=[1,159],$VU=[1,160];
var parser = {trace: function trace () { },
yy: {},
symbols_: {"error":2,"INICIO":3,"INSTRUCCIONES":4,"EOF":5,"TIPO_INSTRUCCION":6,"tk_public":7,"tk_class":8,"identificador":9,"llave_izq":10,"LISTA_METODO_FUNCION":11,"llave_der":12,"tk_interface":13,"SUB_INSTRUCCION_INTERFACE":14,"cm_multiple":15,"cm_simple":16,"METODO_FUNCION":17,"tk_void":18,"parentesis_izq":19,"PARAMETROS_METODO_FUNCION":20,"parentesis_der":21,"LISTA_SUBINSTRUCCION":22,"TIPO_DATO":23,"SENTENCIA_RETURN":24,"punto_coma":25,"tk_static":26,"tk_main":27,"tk_String":28,"corchete_izq":29,"corchete_der":30,"tk_args":31,"DECLARACION":32,"LLAMADA_METODO":33,"SUB_INSTRUCCION":34,"tk_for":35,"EXP_LOGICA":36,"DECLARACION_CONTADOR":37,"SENTENCIA_BC":38,"tk_while":39,"tk_do":40,"SENTENCIA_CONTROL":41,"SENTENCIA_IMPRIMIR":42,"tk_System":43,"punto":44,"tk_out":45,"tk_println":46,"EXP_NUMERICA":47,"tk_print":48,"tk_if":49,"tk_else":50,"LISTA_VARIABLES":51,"igual":52,"mas":53,"MENOS":54,"coma":55,"L_PARAMETROS_METODO_FUNCION":56,"LLAMADA_PARAMETRO":57,"LISTA_LLAMADA_PARAMETRO":58,"EXP_RELACIONAL":59,"op_and":60,"op_or":61,"op_not":62,"mayor":63,"menor":64,"op_mayorigual":65,"op_menor_igual":66,"op_igual_igual":67,"op_not_igual":68,"por":69,"dividido":70,"op_xor":71,"entero":72,"decimal":73,"CADENA":74,"Caracter":75,"tk_int":76,"tk_double":77,"tk_boolean":78,"tk_char":79,"tk_return":80,"tk_break":81,"tk_continue":82,"$accept":0,"$end":1},
terminals_: {2:"error",5:"EOF",7:"tk_public",8:"tk_class",9:"identificador",10:"llave_izq",12:"llave_der",13:"tk_interface",15:"cm_multiple",16:"cm_simple",18:"tk_void",19:"parentesis_izq",21:"parentesis_der",25:"punto_coma",26:"tk_static",27:"tk_main",28:"tk_String",29:"corchete_izq",30:"corchete_der",31:"tk_args",35:"tk_for",39:"tk_while",40:"tk_do",43:"tk_System",44:"punto",45:"tk_out",46:"tk_println",48:"tk_print",49:"tk_if",50:"tk_else",52:"igual",53:"mas",54:"MENOS",55:"coma",60:"op_and",61:"op_or",62:"op_not",63:"mayor",64:"menor",65:"op_mayorigual",66:"op_menor_igual",67:"op_igual_igual",68:"op_not_igual",69:"por",70:"dividido",71:"op_xor",72:"entero",73:"decimal",74:"CADENA",75:"Caracter",76:"tk_int",77:"tk_double",78:"tk_boolean",79:"tk_char",80:"tk_return",81:"tk_break",82:"tk_continue"},
productions_: [0,[3,2],[4,2],[4,1],[6,6],[6,6],[6,1],[6,1],[11,2],[11,1],[17,9],[17,11],[17,13],[17,1],[17,1],[17,1],[14,2],[14,1],[22,2],[22,1],[34,1],[34,1],[34,12],[34,8],[34,10],[34,1],[34,1],[34,1],[34,1],[42,9],[42,9],[41,7],[41,11],[41,9],[32,3],[32,5],[32,4],[32,4],[32,4],[37,2],[37,2],[51,3],[51,1],[20,3],[20,2],[20,0],[56,4],[56,3],[33,5],[57,2],[57,1],[57,0],[58,3],[58,2],[36,3],[36,3],[36,2],[36,1],[59,3],[59,3],[59,3],[59,3],[59,3],[59,3],[59,1],[47,3],[47,3],[47,3],[47,3],[47,2],[47,3],[47,3],[47,1],[47,1],[47,1],[47,1],[47,1],[23,1],[23,1],[23,1],[23,1],[23,1],[24,2],[24,1],[38,2],[38,2],[38,0]],
performAction: function anonymous(yytext, yyleng, yylineno, yy, yystate /* action[1] */, $$ /* vstack */, _$ /* lstack */) {
/* this == yyval */

var $0 = $$.length - 1;
switch (yystate) {
case 1:
 this.$=`${$$[$0-1]}`; return this.$; 
break;
case 2:
this.$ =`${$$[$0-1]}${$$[$0]}`; 
break;
case 3: case 13: case 14: case 27: case 28:
this.$ =`${$$[$0]}`; 
break;
case 4:
 this.$ = `${$$[$0-4]} ${$$[$0-3]} ${$$[$0-2]} \n${$$[$0-1]} \n${$$[$0]}\n`;
break;
case 5:
 
break;
case 6: case 7:
this.$ =`${$$[$0]}\n`; 
break;
case 8:
  this.$ =`${$$[$0-1]}${$$[$0]}`;
break;
case 9: case 19:
this.$ =`${$$[$0]}`;
break;
case 10:
this.$=`${$$[$0-6]}${$$[$0-5]}${$$[$0-4]}${$$[$0-3]}${$$[$0-2]}\n${$$[$0-1]}\n`;
break;
case 11:
this.$=`function ${$$[$0-8]}${$$[$0-7]}${$$[$0-6]}${$$[$0-5]}${$$[$0-4]}\n${$$[$0-3]}${$$[$0-2]};\n${$$[$0]}\n`;
break;
case 12: case 45:
this.$=``;
break;
case 15: case 76:
 this.$ =`${$$[$0]}`; 
break;
case 16:
	
break;
case 18:
 this.$ =`${$$[$0-1]}\n${$$[$0]}`;
break;
case 20: case 21: case 42: case 50: case 64:
this.$ = `${$$[$0]}`;
break;
case 22:
this.$=`\t for${$$[$0-10]}${$$[$0-9]}${$$[$0-8]}${$$[$0-7]}${$$[$0-6]}${$$[$0-5]}${$$[$0-4]}${$$[$0-3]}\n${$$[$0-2]}\n${$$[$0-1]}\n${$$[$0]}\n`;
break;
case 23:
this.$=`\t while(${$$[$0-5]})${$$[$0-3]}\n${$$[$0-2]}\n${$$[$0-1]}\n${$$[$0]}\n`;
break;
case 24:
this.$ = `\t do${$$[$0-8]}\n${$$[$0-7]}\n${$$[$0-6]}\n${$$[$0-5]}while${$$[$0-3]}${$$[$0-2]}${$$[$0-1]};\n`;
break;
case 25: case 44:
this.$=`${$$[$0]}`;
break;
case 26:
this.$= `${$$[$0]}`;
break;
case 29: case 30:
this.$ = `\t console.log(${$$[$0-2]});\n`;
break;
case 31:
 this.$=` if${$$[$0-5]}${$$[$0-4]}${$$[$0-3]}${$$[$0-2]}\n${$$[$0-1]}\n${$$[$0]}\n`;
break;
case 32:
this.$=` if${$$[$0-9]}${$$[$0-8]}${$$[$0-7]}${$$[$0-6]}\n${$$[$0-5]}\n${$$[$0-4]}else${$$[$0-2]}\n${$$[$0-1]}\n${$$[$0]}\n`;
break;
case 33:
this.$=` if${$$[$0-7]}${$$[$0-6]}${$$[$0-5]}${$$[$0-4]}\n${$$[$0-3]}\n${$$[$0-2]}else${$$[$0]}`;
break;
case 34:
this.$ = `\t let ${$$[$0-1]};\n`;
break;
case 35:
 this.$ =`\t let ${$$[$0-3]}${$$[$0-2]}${$$[$0-1]}${$$[$0]}\n`;
break;
case 36:
this.$ = `\t ${$$[$0-3]}${$$[$0-2]}${$$[$0-1]}${$$[$0]}\n`;
break;
case 37: case 38:
 this.$=`\t ${$$[$0-3]}${$$[$0-2]}${$$[$0-1]}${$$[$0]}\n`;
break;
case 39:
 this.$ = `++`; 
break;
case 40:
 this.$ = `--`; 
break;
case 41:
this.$ =`${$$[$0-2]}${$$[$0-1]}${$$[$0]}`;
break;
case 43:
 this.$=`${$$[$0-1]}${$$[$0]}${$$[$01]}`; 
break;
case 46:
this.$=`${$$[$0-3]}${$$[$0-2]}${$$[$0]}`; 
break;
case 47:
this.$=`${$$[$0-2]}${$$[$0]}` ; 
break;
case 48:
 `this.${$$[$0-4]}${$$[$0-3]}${$$[$0-2]}${$$[$0-1]}${$$[$0]}`;
break;
case 49:
 this.$ = `${$$[$0-1]}${$$[$0]}`;  
break;
case 51: case 86:
this.$ = ``;
break;
case 52:
 this.$ =`${$$[$0-2]}${$$[$0-1]}${$$[$0]}`;
break;
case 53:
this.$ = `,${$$[$0]}`;
break;
case 54:
this.$ = `${$$[$0-2]}${$$[$0-1]}${$$[$0]}`; 
break;
case 55:
this.$ = `${$$[$0-2]}${$$[$0-1]}${$$[$0]}`;  
break;
case 56:
this.$ = `${$$[$0-1]}${$$[$0]}`; 
break;
case 57:
 this.$ = `${$$[$0]}`; 
break;
case 58: case 59: case 61: case 63:
 this.$ = `${$$[$0-2]}${$$[$0-1]}${$$[$0]}`; 
break;
case 60: case 62:
 this.$ = `${$$[$0-2]}${$$[$0-1]}${$$[$0]}`;  
break;
case 65:
 this.$=`${$$[$0-2]}+${$$[$0]}`;
break;
case 66:
  this.$ =`${$$[$0-2]}-${$$[$0]}`; 
break;
case 67:
  this.$ = `${$$[$0-2]}*${$$[$0]}`; 
break;
case 68:
  this.$ =`${$$[$0-2]}/${$$[$0]}`; 
break;
case 69:
 this.$ = `-${$$[$0]}`;
break;
case 70:
this.$ =`${$$[$0-2]} ${$$[$0-1]} ${$$[$0]}`;
break;
case 71:
 this.$ =`${$$[$0-2]} ${$$[$0-1]} ${$$[$0]}`;
break;
case 72:
  this.$ =`${$$[$0]}`; 
break;
case 73: case 74: case 75:
 this.$ =`${$$[$0]}`;
break;
case 77:
 this.$ =``; 
break;
case 78:
  this.$ =``; 
break;
case 79: case 81:
  this.$ =``;  
break;
case 80:
 this.$ =``;   
break;
case 82:
 this.$=`return ${$$[$0]}`;
break;
case 83:
this.$ = `return`;
break;
case 84:
 this.$=`break;`;  
break;
case 85:
 this.$=`continue;`; 
break;
}
},
table: [{3:1,4:2,6:3,7:$V0,15:$V1,16:$V2},{1:[3]},{5:[1,7],6:8,7:$V0,15:$V1,16:$V2},o($V3,[2,3]),{8:[1,9],13:[1,10]},o($V3,[2,6]),o($V3,[2,7]),{1:[2,1]},o($V3,[2,2]),{9:[1,11]},{9:[1,12]},{10:[1,13]},{10:[1,14]},{7:$V4,9:$V5,11:15,15:$V6,16:$V7,17:16,23:21,28:$V8,32:20,51:22,76:$V9,77:$Va,78:$Vb,79:$Vc},{9:$Vd,14:29,33:30},{7:$V4,9:$V5,12:[1,32],15:$V6,16:$V7,17:33,23:21,28:$V8,32:20,51:22,76:$V9,77:$Va,78:$Vb,79:$Vc},o($Ve,[2,9]),{18:[1,34],23:35,26:[1,36],28:$V8,76:$V9,77:$Va,78:$Vb,79:$Vc},o($Ve,[2,13]),o($Ve,[2,14]),o($Ve,[2,15]),{9:[1,38],51:37},{52:[1,39],55:$Vf},o($Vg,$Vh,{53:$Vi,54:$Vj}),o($Vk,[2,77]),o($Vk,[2,78]),o($Vk,[2,79]),o($Vk,[2,80]),o($Vk,[2,81]),{9:$Vd,12:[1,43],33:44},o($Vl,[2,17]),{19:$Vm},o($V3,[2,4]),o($Ve,[2,8]),{9:[1,46]},{9:[1,47]},{18:[1,48]},{25:[1,49],52:[1,50],55:$Vf},o($Vn,$Vh),{9:$Vo,19:$Vp,47:51,54:$Vq,72:$Vr,73:$Vs,74:$Vt,75:$Vu},{9:[1,59]},{53:[1,60]},{54:[1,61]},o($V3,[2,5]),o($Vl,[2,16]),{9:$Vo,19:$Vp,21:[2,51],47:63,54:$Vq,57:62,72:$Vr,73:$Vs,74:$Vt,75:$Vu},{19:[1,64]},{19:[1,65]},{27:[1,66]},o($Vv,[2,34]),{9:$Vo,19:$Vp,47:67,54:$Vq,72:$Vr,73:$Vs,74:$Vt,75:$Vu},{25:[1,68],53:$Vw,54:$Vx,69:$Vy,70:$Vz,71:$VA},{9:$Vo,19:$Vp,47:74,54:$Vq,72:$Vr,73:$Vs,74:$Vt,75:$Vu},{9:$Vo,19:$Vp,47:75,54:$Vq,72:$Vr,73:$Vs,74:$Vt,75:$Vu},o($VB,[2,72]),o($VB,[2,73]),o($VB,[2,74]),o($VB,[2,75]),o($VB,[2,76]),o($Vn,[2,41]),{25:[1,76]},{25:[1,77]},{21:[1,78]},{21:[2,50],53:$Vw,54:$Vx,55:[1,80],58:79,69:$Vy,70:$Vz,71:$VA},{20:81,21:$VC,23:82,28:$V8,76:$V9,77:$Va,78:$Vb,79:$Vc},{20:83,21:$VC,23:82,28:$V8,76:$V9,77:$Va,78:$Vb,79:$Vc},{19:[1,84]},{25:[1,85],53:$Vw,54:$Vx,69:$Vy,70:$Vz,71:$VA},o($Vv,[2,36]),{9:$Vo,19:$Vp,47:86,54:$Vq,72:$Vr,73:$Vs,74:$Vt,75:$Vu},{9:$Vo,19:$Vp,47:87,54:$Vq,72:$Vr,73:$Vs,74:$Vt,75:$Vu},{9:$Vo,19:$Vp,47:88,54:$Vq,72:$Vr,73:$Vs,74:$Vt,75:$Vu},{9:$Vo,19:$Vp,47:89,54:$Vq,72:$Vr,73:$Vs,74:$Vt,75:$Vu},{9:$Vo,19:$Vp,47:90,54:$Vq,72:$Vr,73:$Vs,74:$Vt,75:$Vu},o($VB,[2,69]),{21:[1,91],53:$Vw,54:$Vx,69:$Vy,70:$Vz,71:$VA},o($Vv,[2,37]),o($Vv,[2,38]),{25:[1,92]},{21:[2,49],55:[1,93]},{9:$Vo,19:$Vp,47:94,54:$Vq,72:$Vr,73:$Vs,74:$Vt,75:$Vu},{21:[1,95]},{9:$Vo,19:$Vp,47:96,54:$Vq,72:$Vr,73:$Vs,74:$Vt,75:$Vu},{21:[1,97]},{28:[1,98]},o($Vv,[2,35]),o($VD,[2,65],{69:$Vy,70:$Vz,71:$VA}),o($VD,[2,66],{69:$Vy,70:$Vz,71:$VA}),o($VE,[2,67],{71:$VA}),o($VE,[2,68],{71:$VA}),o($VB,[2,70]),o($VB,[2,71]),o($VF,[2,48]),{9:$Vo,19:$Vp,47:99,54:$Vq,72:$Vr,73:$Vs,74:$Vt,75:$Vu},o($VG,[2,53],{53:$Vw,54:$Vx,69:$Vy,70:$Vz,71:$VA}),{10:[1,100]},{21:[2,44],53:$Vw,54:$Vx,55:[1,102],56:101,69:$Vy,70:$Vz,71:$VA},{10:[1,103]},{29:[1,104]},o($VG,[2,52],{53:$Vw,54:$Vx,69:$Vy,70:$Vz,71:$VA}),{9:$VH,15:$VI,16:$VJ,22:105,23:21,28:$V8,32:107,33:108,34:106,35:$VK,39:$VL,40:$VM,41:112,42:113,43:$VN,49:$VO,51:22,76:$V9,77:$Va,78:$Vb,79:$Vc},{21:[2,43],55:[1,119]},{23:120,28:$V8,76:$V9,77:$Va,78:$Vb,79:$Vc},{9:$VH,15:$VI,16:$VJ,22:121,23:21,28:$V8,32:107,33:108,34:106,35:$VK,39:$VL,40:$VM,41:112,42:113,43:$VN,49:$VO,51:22,76:$V9,77:$Va,78:$Vb,79:$Vc},{30:[1,122]},{9:$VH,12:[1,123],15:$VI,16:$VJ,23:21,28:$V8,32:107,33:108,34:124,35:$VK,39:$VL,40:$VM,41:112,42:113,43:$VN,49:$VO,51:22,76:$V9,77:$Va,78:$Vb,79:$Vc},o($VF,[2,19]),o($VF,[2,20]),o($VF,[2,21]),{19:[1,125]},{19:[1,126]},{10:[1,127]},o($VF,[2,25]),o($VF,[2,26]),o($VF,[2,27]),o($VF,[2,28]),o($Vg,$Vh,{19:$Vm,53:$Vi,54:$Vj}),{19:[1,128]},{44:[1,129]},{23:130,28:$V8,76:$V9,77:$Va,78:$Vb,79:$Vc},{9:$Vo,19:$Vp,47:131,54:$Vq,72:$Vr,73:$Vs,74:$Vt,75:$Vu},{9:$VH,15:$VI,16:$VJ,23:21,24:132,28:$V8,32:107,33:108,34:124,35:$VK,39:$VL,40:$VM,41:112,42:113,43:$VN,49:$VO,51:22,76:$V9,77:$Va,78:$Vb,79:$Vc,80:[1,133]},{31:[1,134]},o($Ve,[2,10]),o($VF,[2,18]),{9:$V5,23:21,28:$V8,32:135,51:22,76:$V9,77:$Va,78:$Vb,79:$Vc},{9:$Vo,19:$Vp,36:136,47:139,54:$Vq,59:137,62:$VP,72:$Vr,73:$Vs,74:$Vt,75:$Vu},{9:$VH,15:$VI,16:$VJ,22:140,23:21,28:$V8,32:107,33:108,34:106,35:$VK,39:$VL,40:$VM,41:112,42:113,43:$VN,49:$VO,51:22,76:$V9,77:$Va,78:$Vb,79:$Vc},{9:$Vo,19:$Vp,36:141,47:139,54:$Vq,59:137,62:$VP,72:$Vr,73:$Vs,74:$Vt,75:$Vu},{45:[1,142]},{9:$Vo,19:$Vp,47:143,54:$Vq,72:$Vr,73:$Vs,74:$Vt,75:$Vu},o($VG,[2,47],{53:$Vw,54:$Vx,69:$Vy,70:$Vz,71:$VA}),{25:[1,144]},{9:$Vo,19:$Vp,25:[2,83],47:145,54:$Vq,72:$Vr,73:$Vs,74:$Vt,75:$Vu},{21:[1,146]},{9:$Vo,19:$Vp,36:147,47:139,54:$Vq,59:137,62:$VP,72:$Vr,73:$Vs,74:$Vt,75:$Vu},{21:[1,148]},o($VQ,[2,57],{60:[1,149],61:[1,150]}),{9:$Vo,19:$Vp,47:139,54:$Vq,59:151,72:$Vr,73:$Vs,74:$Vt,75:$Vu},o($VR,[2,64],{53:$Vw,54:$Vx,63:[1,152],64:[1,153],65:[1,154],66:[1,155],67:[1,156],68:[1,157],69:$Vy,70:$Vz,71:$VA}),{9:$VH,12:$VS,15:$VI,16:$VJ,23:21,28:$V8,32:107,33:108,34:124,35:$VK,38:158,39:$VL,40:$VM,41:112,42:113,43:$VN,49:$VO,51:22,76:$V9,77:$Va,78:$Vb,79:$Vc,81:$VT,82:$VU},{21:[1,161]},{44:[1,162]},o($VG,[2,46],{53:$Vw,54:$Vx,69:$Vy,70:$Vz,71:$VA}),{12:[1,163]},{25:[2,82],53:$Vw,54:$Vx,69:$Vy,70:$Vz,71:$VA},{10:[1,164]},{25:[1,165]},{10:[1,166]},{9:$Vo,19:$Vp,47:139,54:$Vq,59:167,72:$Vr,73:$Vs,74:$Vt,75:$Vu},{9:$Vo,19:$Vp,47:139,54:$Vq,59:168,72:$Vr,73:$Vs,74:$Vt,75:$Vu},o($VQ,[2,56]),{9:$Vo,19:$Vp,47:169,54:$Vq,72:$Vr,73:$Vs,74:$Vt,75:$Vu},{9:$Vo,19:$Vp,47:170,54:$Vq,72:$Vr,73:$Vs,74:$Vt,75:$Vu},{9:$Vo,19:$Vp,47:171,54:$Vq,72:$Vr,73:$Vs,74:$Vt,75:$Vu},{9:$Vo,19:$Vp,47:172,54:$Vq,72:$Vr,73:$Vs,74:$Vt,75:$Vu},{9:$Vo,19:$Vp,47:173,54:$Vq,72:$Vr,73:$Vs,74:$Vt,75:$Vu},{9:$Vo,19:$Vp,47:174,54:$Vq,72:$Vr,73:$Vs,74:$Vt,75:$Vu},{12:[1,175]},{25:[1,176]},{25:[1,177]},{10:[1,178]},{46:[1,179],48:[1,180]},o($Ve,[2,11]),{9:$VH,15:$VI,16:$VJ,22:181,23:21,28:$V8,32:107,33:108,34:106,35:$VK,39:$VL,40:$VM,41:112,42:113,43:$VN,49:$VO,51:22,76:$V9,77:$Va,78:$Vb,79:$Vc},{9:[1,182]},{9:$VH,15:$VI,16:$VJ,22:183,23:21,28:$V8,32:107,33:108,34:106,35:$VK,39:$VL,40:$VM,41:112,42:113,43:$VN,49:$VO,51:22,76:$V9,77:$Va,78:$Vb,79:$Vc},o($VQ,[2,54]),o($VQ,[2,55]),o($VR,[2,58],{53:$Vw,54:$Vx,69:$Vy,70:$Vz,71:$VA}),o($VR,[2,59],{53:$Vw,54:$Vx,69:$Vy,70:$Vz,71:$VA}),o($VR,[2,60],{53:$Vw,54:$Vx,69:$Vy,70:$Vz,71:$VA}),o($VR,[2,61],{53:$Vw,54:$Vx,69:$Vy,70:$Vz,71:$VA}),o($VR,[2,62],{53:$Vw,54:$Vx,69:$Vy,70:$Vz,71:$VA}),o($VR,[2,63],{53:$Vw,54:$Vx,69:$Vy,70:$Vz,71:$VA}),{39:[1,184]},{12:[2,84]},{12:[2,85]},{9:$VH,15:$VI,16:$VJ,23:21,28:$V8,32:107,33:108,34:185,35:$VK,39:$VL,40:$VM,41:112,42:113,43:$VN,49:$VO,51:22,76:$V9,77:$Va,78:$Vb,79:$Vc},{19:[1,186]},{19:[1,187]},{9:$VH,12:[1,188],15:$VI,16:$VJ,23:21,28:$V8,32:107,33:108,34:124,35:$VK,39:$VL,40:$VM,41:112,42:113,43:$VN,49:$VO,51:22,76:$V9,77:$Va,78:$Vb,79:$Vc},{37:189,53:[1,190],54:[1,191]},{9:$VH,12:$VS,15:$VI,16:$VJ,23:21,28:$V8,32:107,33:108,34:124,35:$VK,38:192,39:$VL,40:$VM,41:112,42:113,43:$VN,49:$VO,51:22,76:$V9,77:$Va,78:$Vb,79:$Vc,81:$VT,82:$VU},{19:[1,193]},{12:[1,194]},{9:$Vo,19:$Vp,47:195,54:$Vq,72:$Vr,73:$Vs,74:$Vt,75:$Vu},{9:$Vo,19:$Vp,47:196,54:$Vq,72:$Vr,73:$Vs,74:$Vt,75:$Vu},o($Ve,[2,12]),{21:[1,197]},{53:[1,198]},{54:[1,199]},{12:[1,200]},{9:$Vo,19:$Vp,36:201,47:139,54:$Vq,59:137,62:$VP,72:$Vr,73:$Vs,74:$Vt,75:$Vu},o($VF,[2,31],{50:[1,202]}),{21:[1,203],53:$Vw,54:$Vx,69:$Vy,70:$Vz,71:$VA},{21:[1,204],53:$Vw,54:$Vx,69:$Vy,70:$Vz,71:$VA},{10:[1,205]},{21:[2,39]},{21:[2,40]},o($VF,[2,23]),{21:[1,206]},{10:[1,207],41:208,49:$VO},{25:[1,209]},{25:[1,210]},{9:$VH,15:$VI,16:$VJ,22:211,23:21,28:$V8,32:107,33:108,34:106,35:$VK,39:$VL,40:$VM,41:112,42:113,43:$VN,49:$VO,51:22,76:$V9,77:$Va,78:$Vb,79:$Vc},{25:[1,212]},{9:$VH,15:$VI,16:$VJ,23:21,28:$V8,32:107,33:108,34:213,35:$VK,39:$VL,40:$VM,41:112,42:113,43:$VN,49:$VO,51:22,76:$V9,77:$Va,78:$Vb,79:$Vc},o($VF,[2,33]),o($VF,[2,29]),o($VF,[2,30]),{9:$VH,12:$VS,15:$VI,16:$VJ,23:21,28:$V8,32:107,33:108,34:124,35:$VK,38:214,39:$VL,40:$VM,41:112,42:113,43:$VN,49:$VO,51:22,76:$V9,77:$Va,78:$Vb,79:$Vc,81:$VT,82:$VU},o($VF,[2,24]),{12:[1,215]},{12:[1,216]},o($VF,[2,32]),o($VF,[2,22])],
defaultActions: {7:[2,1],176:[2,84],177:[2,85],198:[2,39],199:[2,40]},
parseError: function parseError (str, hash) {
    if (hash.recoverable) {
        this.trace(str);
    } else {
        var error = new Error(str);
        error.hash = hash;
        throw error;
    }
},
parse: function parse(input) {
    var self = this, stack = [0], tstack = [], vstack = [null], lstack = [], table = this.table, yytext = '', yylineno = 0, yyleng = 0, recovering = 0, TERROR = 2, EOF = 1;
    var args = lstack.slice.call(arguments, 1);
    var lexer = Object.create(this.lexer);
    var sharedState = { yy: {} };
    for (var k in this.yy) {
        if (Object.prototype.hasOwnProperty.call(this.yy, k)) {
            sharedState.yy[k] = this.yy[k];
        }
    }
    lexer.setInput(input, sharedState.yy);
    sharedState.yy.lexer = lexer;
    sharedState.yy.parser = this;
    if (typeof lexer.yylloc == 'undefined') {
        lexer.yylloc = {};
    }
    var yyloc = lexer.yylloc;
    lstack.push(yyloc);
    var ranges = lexer.options && lexer.options.ranges;
    if (typeof sharedState.yy.parseError === 'function') {
        this.parseError = sharedState.yy.parseError;
    } else {
        this.parseError = Object.getPrototypeOf(this).parseError;
    }
    function popStack(n) {
        stack.length = stack.length - 2 * n;
        vstack.length = vstack.length - n;
        lstack.length = lstack.length - n;
    }
    _token_stack:
        var lex = function () {
            var token;
            token = lexer.lex() || EOF;
            if (typeof token !== 'number') {
                token = self.symbols_[token] || token;
            }
            return token;
        };
    var symbol, preErrorSymbol, state, action, a, r, yyval = {}, p, len, newState, expected;
    while (true) {
        state = stack[stack.length - 1];
        if (this.defaultActions[state]) {
            action = this.defaultActions[state];
        } else {
            if (symbol === null || typeof symbol == 'undefined') {
                symbol = lex();
            }
            action = table[state] && table[state][symbol];
        }
                    if (typeof action === 'undefined' || !action.length || !action[0]) {
                var errStr = '';
                expected = [];
                for (p in table[state]) {
                    if (this.terminals_[p] && p > TERROR) {
                        expected.push('\'' + this.terminals_[p] + '\'');
                    }
                }
                if (lexer.showPosition) {
                    errStr = 'Parse error on line ' + (yylineno + 1) + ':\n' + lexer.showPosition() + '\nExpecting ' + expected.join(', ') + ', got \'' + (this.terminals_[symbol] || symbol) + '\'';
                } else {
                    errStr = 'Parse error on line ' + (yylineno + 1) + ': Unexpected ' + (symbol == EOF ? 'end of input' : '\'' + (this.terminals_[symbol] || symbol) + '\'');
                }
                this.parseError(errStr, {
                    text: lexer.match,
                    token: this.terminals_[symbol] || symbol,
                    line: lexer.yylineno,
                    loc: yyloc,
                    expected: expected
                });
            }
        if (action[0] instanceof Array && action.length > 1) {
            throw new Error('Parse Error: multiple actions possible at state: ' + state + ', token: ' + symbol);
        }
        switch (action[0]) {
        case 1:
            stack.push(symbol);
            vstack.push(lexer.yytext);
            lstack.push(lexer.yylloc);
            stack.push(action[1]);
            symbol = null;
            if (!preErrorSymbol) {
                yyleng = lexer.yyleng;
                yytext = lexer.yytext;
                yylineno = lexer.yylineno;
                yyloc = lexer.yylloc;
                if (recovering > 0) {
                    recovering--;
                }
            } else {
                symbol = preErrorSymbol;
                preErrorSymbol = null;
            }
            break;
        case 2:
            len = this.productions_[action[1]][1];
            yyval.$ = vstack[vstack.length - len];
            yyval._$ = {
                first_line: lstack[lstack.length - (len || 1)].first_line,
                last_line: lstack[lstack.length - 1].last_line,
                first_column: lstack[lstack.length - (len || 1)].first_column,
                last_column: lstack[lstack.length - 1].last_column
            };
            if (ranges) {
                yyval._$.range = [
                    lstack[lstack.length - (len || 1)].range[0],
                    lstack[lstack.length - 1].range[1]
                ];
            }
            r = this.performAction.apply(yyval, [
                yytext,
                yyleng,
                yylineno,
                sharedState.yy,
                action[1],
                vstack,
                lstack
            ].concat(args));
            if (typeof r !== 'undefined') {
                return r;
            }
            if (len) {
                stack = stack.slice(0, -1 * len * 2);
                vstack = vstack.slice(0, -1 * len);
                lstack = lstack.slice(0, -1 * len);
            }
            stack.push(this.productions_[action[1]][0]);
            vstack.push(yyval.$);
            lstack.push(yyval._$);
            newState = table[stack[stack.length - 2]][stack[stack.length - 1]];
            stack.push(newState);
            break;
        case 3:
            return true;
        }
    }
    return true;
}};

	//const Nodo = require('./AstTree');
/* generated by jison-lex 0.3.4 */
var lexer = (function(){
var lexer = ({

EOF:1,

parseError:function parseError(str, hash) {
        if (this.yy.parser) {
            this.yy.parser.parseError(str, hash);
        } else {
            throw new Error(str);
        }
    },

// resets the lexer, sets new input
setInput:function (input, yy) {
        this.yy = yy || this.yy || {};
        this._input = input;
        this._more = this._backtrack = this.done = false;
        this.yylineno = this.yyleng = 0;
        this.yytext = this.matched = this.match = '';
        this.conditionStack = ['INITIAL'];
        this.yylloc = {
            first_line: 1,
            first_column: 0,
            last_line: 1,
            last_column: 0
        };
        if (this.options.ranges) {
            this.yylloc.range = [0,0];
        }
        this.offset = 0;
        return this;
    },

// consumes and returns one char from the input
input:function () {
        var ch = this._input[0];
        this.yytext += ch;
        this.yyleng++;
        this.offset++;
        this.match += ch;
        this.matched += ch;
        var lines = ch.match(/(?:\r\n?|\n).*/g);
        if (lines) {
            this.yylineno++;
            this.yylloc.last_line++;
        } else {
            this.yylloc.last_column++;
        }
        if (this.options.ranges) {
            this.yylloc.range[1]++;
        }

        this._input = this._input.slice(1);
        return ch;
    },

// unshifts one char (or a string) into the input
unput:function (ch) {
        var len = ch.length;
        var lines = ch.split(/(?:\r\n?|\n)/g);

        this._input = ch + this._input;
        this.yytext = this.yytext.substr(0, this.yytext.length - len);
        //this.yyleng -= len;
        this.offset -= len;
        var oldLines = this.match.split(/(?:\r\n?|\n)/g);
        this.match = this.match.substr(0, this.match.length - 1);
        this.matched = this.matched.substr(0, this.matched.length - 1);

        if (lines.length - 1) {
            this.yylineno -= lines.length - 1;
        }
        var r = this.yylloc.range;

        this.yylloc = {
            first_line: this.yylloc.first_line,
            last_line: this.yylineno + 1,
            first_column: this.yylloc.first_column,
            last_column: lines ?
                (lines.length === oldLines.length ? this.yylloc.first_column : 0)
                 + oldLines[oldLines.length - lines.length].length - lines[0].length :
              this.yylloc.first_column - len
        };

        if (this.options.ranges) {
            this.yylloc.range = [r[0], r[0] + this.yyleng - len];
        }
        this.yyleng = this.yytext.length;
        return this;
    },

// When called from action, caches matched text and appends it on next action
more:function () {
        this._more = true;
        return this;
    },

// When called from action, signals the lexer that this rule fails to match the input, so the next matching rule (regex) should be tested instead.
reject:function () {
        if (this.options.backtrack_lexer) {
            this._backtrack = true;
        } else {
            return this.parseError('Lexical error on line ' + (this.yylineno + 1) + '. You can only invoke reject() in the lexer when the lexer is of the backtracking persuasion (options.backtrack_lexer = true).\n' + this.showPosition(), {
                text: "",
                token: null,
                line: this.yylineno
            });

        }
        return this;
    },

// retain first n characters of the match
less:function (n) {
        this.unput(this.match.slice(n));
    },

// displays already matched input, i.e. for error messages
pastInput:function () {
        var past = this.matched.substr(0, this.matched.length - this.match.length);
        return (past.length > 20 ? '...':'') + past.substr(-20).replace(/\n/g, "");
    },

// displays upcoming input, i.e. for error messages
upcomingInput:function () {
        var next = this.match;
        if (next.length < 20) {
            next += this._input.substr(0, 20-next.length);
        }
        return (next.substr(0,20) + (next.length > 20 ? '...' : '')).replace(/\n/g, "");
    },

// displays the character position where the lexing error occurred, i.e. for error messages
showPosition:function () {
        var pre = this.pastInput();
        var c = new Array(pre.length + 1).join("-");
        return pre + this.upcomingInput() + "\n" + c + "^";
    },

// test the lexed token: return FALSE when not a match, otherwise return token
test_match:function(match, indexed_rule) {
        var token,
            lines,
            backup;

        if (this.options.backtrack_lexer) {
            // save context
            backup = {
                yylineno: this.yylineno,
                yylloc: {
                    first_line: this.yylloc.first_line,
                    last_line: this.last_line,
                    first_column: this.yylloc.first_column,
                    last_column: this.yylloc.last_column
                },
                yytext: this.yytext,
                match: this.match,
                matches: this.matches,
                matched: this.matched,
                yyleng: this.yyleng,
                offset: this.offset,
                _more: this._more,
                _input: this._input,
                yy: this.yy,
                conditionStack: this.conditionStack.slice(0),
                done: this.done
            };
            if (this.options.ranges) {
                backup.yylloc.range = this.yylloc.range.slice(0);
            }
        }

        lines = match[0].match(/(?:\r\n?|\n).*/g);
        if (lines) {
            this.yylineno += lines.length;
        }
        this.yylloc = {
            first_line: this.yylloc.last_line,
            last_line: this.yylineno + 1,
            first_column: this.yylloc.last_column,
            last_column: lines ?
                         lines[lines.length - 1].length - lines[lines.length - 1].match(/\r?\n?/)[0].length :
                         this.yylloc.last_column + match[0].length
        };
        this.yytext += match[0];
        this.match += match[0];
        this.matches = match;
        this.yyleng = this.yytext.length;
        if (this.options.ranges) {
            this.yylloc.range = [this.offset, this.offset += this.yyleng];
        }
        this._more = false;
        this._backtrack = false;
        this._input = this._input.slice(match[0].length);
        this.matched += match[0];
        token = this.performAction.call(this, this.yy, this, indexed_rule, this.conditionStack[this.conditionStack.length - 1]);
        if (this.done && this._input) {
            this.done = false;
        }
        if (token) {
            return token;
        } else if (this._backtrack) {
            // recover context
            for (var k in backup) {
                this[k] = backup[k];
            }
            return false; // rule action called reject() implying the next rule should be tested instead.
        }
        return false;
    },

// return next match in input
next:function () {
        if (this.done) {
            return this.EOF;
        }
        if (!this._input) {
            this.done = true;
        }

        var token,
            match,
            tempMatch,
            index;
        if (!this._more) {
            this.yytext = '';
            this.match = '';
        }
        var rules = this._currentRules();
        for (var i = 0; i < rules.length; i++) {
            tempMatch = this._input.match(this.rules[rules[i]]);
            if (tempMatch && (!match || tempMatch[0].length > match[0].length)) {
                match = tempMatch;
                index = i;
                if (this.options.backtrack_lexer) {
                    token = this.test_match(tempMatch, rules[i]);
                    if (token !== false) {
                        return token;
                    } else if (this._backtrack) {
                        match = false;
                        continue; // rule action called reject() implying a rule MISmatch.
                    } else {
                        // else: this is a lexer rule which consumes input without producing a token (e.g. whitespace)
                        return false;
                    }
                } else if (!this.options.flex) {
                    break;
                }
            }
        }
        if (match) {
            token = this.test_match(match, rules[index]);
            if (token !== false) {
                return token;
            }
            // else: this is a lexer rule which consumes input without producing a token (e.g. whitespace)
            return false;
        }
        if (this._input === "") {
            return this.EOF;
        } else {
            return this.parseError('Lexical error on line ' + (this.yylineno + 1) + '. Unrecognized text.\n' + this.showPosition(), {
                text: "",
                token: null,
                line: this.yylineno
            });
        }
    },

// return next match that has a token
lex:function lex () {
        var r = this.next();
        if (r) {
            return r;
        } else {
            return this.lex();
        }
    },

// activates a new lexer condition state (pushes the new lexer condition state onto the condition stack)
begin:function begin (condition) {
        this.conditionStack.push(condition);
    },

// pop the previously active lexer condition state off the condition stack
popState:function popState () {
        var n = this.conditionStack.length - 1;
        if (n > 0) {
            return this.conditionStack.pop();
        } else {
            return this.conditionStack[0];
        }
    },

// produce the lexer rule set which is active for the currently active lexer condition state
_currentRules:function _currentRules () {
        if (this.conditionStack.length && this.conditionStack[this.conditionStack.length - 1]) {
            return this.conditions[this.conditionStack[this.conditionStack.length - 1]].rules;
        } else {
            return this.conditions["INITIAL"].rules;
        }
    },

// return the currently active lexer condition state; when an index argument is provided it produces the N-th previous condition state, if available
topState:function topState (n) {
        n = this.conditionStack.length - 1 - Math.abs(n || 0);
        if (n >= 0) {
            return this.conditionStack[n];
        } else {
            return "INITIAL";
        }
    },

// alias for begin(condition)
pushState:function pushState (condition) {
        this.begin(condition);
    },

// return the number of states currently on the stack
stateStackSize:function stateStackSize() {
        return this.conditionStack.length;
    },
options: {"case-insensitive":true},
performAction: function anonymous(yy,yy_,$avoiding_name_collisions,YY_START) {
var YYSTATE=YY_START;
switch($avoiding_name_collisions) {
case 0:return 15; 
break;
case 1:return 16; 
break;
case 2:return 7;
break;
case 3:return 26;
break;
case 4:return 8;
break;
case 5:return 13;
break;
case 6:return 18;
break;
case 7:return 27;
break;
case 8:return 31;
break;
case 9:return 43;
break;
case 10:return 45;
break;
case 11:return 48;
break;
case 12:return 46;
break;
case 13:return 76;
break;
case 14:return 77;
break;
case 15:return 79;
break;
case 16:return 78;
break;
case 17:return 28;
break;
case 18:return 35;
break;
case 19:return 39;
break;
case 20:return 40;
break;
case 21:return 81;
break;
case 22:return 80;
break;
case 23:return 82;
break;
case 24:return 49;
break;
case 25:return 50;
break;
case 26:return 25; 
break;
case 27:return 19; 
break;
case 28:return 21; 
break;
case 29:return 29; 
break;
case 30:return 30; 
break;
case 31:return 10
break;
case 32:return 12
break;
case 33:return 55; 
break;
case 34:return 44; 
break;
case 35:return 65;
break;
case 36:return 66;
break;
case 37:return 60;
break;
case 38:return 61;
break;
case 39:return 68;
break;
case 40:return 67;
break;
case 41:return 53;
break;
case 42:return 54;
break;
case 43:return 69;
break;
case 44:return 70;
break;
case 45:return 71;
break;
case 46:return 63;
break;
case 47:return 64;
break;
case 48:return 52; 
break;
case 49:return 62;
break;
case 50: /*ignore */
break;
case 51:/*it will count */
break;
case 52:// se ignoran espacios en blanco
break;
case 53: return 74;
break;
case 54:return 75;
break;
case 55:return 73; 
break;
case 56:return 72; 
break;
case 57:return 9; 
break;
case 58:return 5; 
break;
case 59: console.error('Este es un error léxico: ' + yy_.yytext + ', en la linea: ' + yy_.yylloc.first_line + ', en la columna: ' + yy_.yylloc.first_column); 
break;
}
},
rules: [/^(?:[/][*][^*]*[*]+([^/*][^*]*[*]+)*[/])/i,/^(?:\/\/.*)/i,/^(?:public\b)/i,/^(?:static\b)/i,/^(?:class\b)/i,/^(?:interface\b)/i,/^(?:void\b)/i,/^(?:main\b)/i,/^(?:args\b)/i,/^(?:System\b)/i,/^(?:out\b)/i,/^(?:print\b)/i,/^(?:println\b)/i,/^(?:int\b)/i,/^(?:double\b)/i,/^(?:char\b)/i,/^(?:boolean\b)/i,/^(?:String\b)/i,/^(?:for\b)/i,/^(?:while\b)/i,/^(?:do\b)/i,/^(?:break\b)/i,/^(?:return\b)/i,/^(?:continue\b)/i,/^(?:if\b)/i,/^(?:else\b)/i,/^(?:;)/i,/^(?:\()/i,/^(?:\))/i,/^(?:\[)/i,/^(?:\])/i,/^(?:\{)/i,/^(?:\})/i,/^(?:,)/i,/^(?:\.)/i,/^(?:>=)/i,/^(?:<=)/i,/^(?:&&)/i,/^(?:\|\|)/i,/^(?:!=)/i,/^(?:==)/i,/^(?:\+)/i,/^(?:-)/i,/^(?:\*)/i,/^(?:\/)/i,/^(?:\^)/i,/^(?:>)/i,/^(?:<)/i,/^(?:=)/i,/^(?:!)/i,/^(?:[ \r\t\f]+)/i,/^(?:\n)/i,/^(?:\s+)/i,/^(?:"[^\"]*")/i,/^(?:'[^']')/i,/^(?:[0-9]+(\.[0-9]+)?\b)/i,/^(?:[0-9]+\b)/i,/^(?:([a-zA-Z])[a-zA-Z0-9_]*)/i,/^(?:$)/i,/^(?:.)/i],
conditions: {"INITIAL":{"rules":[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59],"inclusive":true}}
});
return lexer;
})();
parser.lexer = lexer;
function Parser () {
  this.yy = {};
}
Parser.prototype = parser;parser.Parser = Parser;
return new Parser;
})();


if (typeof require !== 'undefined' && typeof exports !== 'undefined') {
exports.parser = G_JS;
exports.Parser = G_JS.Parser;
exports.parse = function () { return G_JS.parse.apply(G_JS, arguments); };
exports.main = function commonjsMain (args) {
    if (!args[1]) {
        console.log('Usage: '+args[0]+' FILE');
        process.exit(1);
    }
    var source = require('fs').readFileSync(require('path').normalize(args[1]), "utf8");
    return exports.parser.parse(source);
};
if (typeof module !== 'undefined' && require.main === module) {
  exports.main(process.argv.slice(1));
}
}