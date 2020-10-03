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