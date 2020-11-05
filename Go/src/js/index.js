


var tabIndex=2;

function openEditorTab(evt, tabName) {

  var i, tabcontent, tabBtns;

  tabcontent = document.getElementsByClassName("tabContent");
  for (i = 0; i < tabcontent.length; i++) {
      tabcontent[i].style.display = "none";
  }

  tabBtns = document.getElementsByClassName("tabBtn");
  for (i = 0; i < tabBtns.length; i++) {
      tabBtns[i].style.backgroundColor = "";
      tabBtns[i].className = tabBtns[i].className.replace(" active", "");
  }

  document.getElementById(tabName).style.display = "block";
  evt.currentTarget.className += " active";

}




function addTab(){

  //Contenido de Tab
  var newTab = document.createElement("div");
  newTab.id="tab"+tabIndex;
  newTab.className="tabContent";
  document.getElementById("myTabPage").appendChild(newTab);

  var newTxtArea = document.createElement("textarea");
  newTxtArea.id="txtArea"+tabIndex;
  newTxtArea.rows=20;
  newTab.appendChild(newTxtArea);


  //Boton de Tab
  var newItem = document.createElement("li");
  newItem.className="nav-item"

  var newTabButton = document.createElement("a");
  newTabButton.className="tabBtn nav-link ";
  newTabButton.id=tabIndex;
  newTabButton.innerHTML="Pestaña"+tabIndex;
  newTabButton.onclick= function(){openEditorTab(event,"tab"+this.id)};
  newItem.appendChild(newTabButton);

  document.getElementById("tabPageBtns").appendChild(newItem);

  tabIndex++;
}



/*OPEN FILE CHOOSER */

function openArchive(e){
  var archivo = e.target.files[0];
  if (!archivo) {
    return;
  }
  var lector = new FileReader();
  lector.onload = function(e) {
    var contenido = e.target.result;
    showText(contenido);
  };
  lector.readAsText(archivo);
}

function showText(contenido) {
  var indice = document.getElementsByClassName("nav-link active tabBtn")
  var txtCSharp = document.getElementById("txtArea"+indice[0].id)
  console.log(contenido);
  txtCSharp.innerHTML = contenido;
}



function obtenerSaludo(){

  removeAllChildNodes(document.querySelector('#token_display'));
  var indice = document.getElementsByClassName("nav-link active tabBtn")
  var TxtCSharp = document.getElementById("txtArea"+indice[0].id)
  var curso = TxtCSharp.value;
  ;
  
  fetch('../getInfo', {
      method: 'POST',
      body: JSON.stringify({"Nombre":curso}),
      headers:{
        'Content-Type': 'application/json'
      }
      
  }
  ).then(res => res.json())
  .catch(error => console.error('Error:', error))
  .then(response => view(response));
  
}

function view(response){
 
  d3.select(document.getElementById("graph")).graphviz()
  .renderDot('digraph  {'+response.Saludo+'}');
  
  TokenReport(response.Saludo2);
}

function TokenReport(TokenObject){
  let obj_t = JSON.parse(TokenObject);
  let NewRow;
  let NewColumn;
  console.log(obj_t.tokens[0].tipo);
  console.log(obj_t.tokens[1].tipo);
  console.log(obj_t.tokens[2].tipo);
  for (tk in obj_t.tokens) {
   
    NewRow=document.createElement("tr");

    NewColumn=document.createElement("th");
    NewColumn.innerHTML=tk;
    NewRow.appendChild(NewColumn);

    NewColumn=document.createElement("td");
    NewColumn.innerHTML=obj_t.tokens[tk].fila;
    NewRow.appendChild(NewColumn);

    NewColumn=document.createElement("td");
    NewColumn.innerHTML=obj_t.tokens[tk].columna;
    NewRow.appendChild(NewColumn);

    NewColumn=document.createElement("td");
    NewColumn.innerHTML=`"`+obj_t.tokens[tk].lexema+`"`;
    NewRow.appendChild(NewColumn);

    NewColumn=document.createElement("td");
    NewColumn.innerHTML=obj_t.tokens[tk].tipo;
    NewRow.appendChild(NewColumn);

    NewColumn=document.createElement("td");
    NewColumn.innerHTML=obj_t.tokens[tk].correlativo;
    NewRow.appendChild(NewColumn);
    
    document.getElementById("token_display").appendChild(NewRow);
  }
  
}

function removeAllChildNodes(parent) {
  while (parent.firstChild) {
      parent.removeChild(parent.firstChild);
  }
}

