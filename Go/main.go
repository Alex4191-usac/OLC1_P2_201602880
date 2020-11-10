package main

import (
	"bytes"
	"encoding/json"
	"fmt"
	"html/template"
	"io/ioutil"
	"net/http"
	"os"
)

func index(w http.ResponseWriter, r *http.Request) {
	template, err := template.ParseFiles("index.html")

	if err != nil {
		//ADD 404 PAGE
		fmt.Fprintf(w, "404 page not Found!!!")
	} else {
		template.Execute(w, nil)
	}
}

type curso struct {
	Nombre string
}

type javaFile struct {
	Textot string
}

/*TEST FILES*/
func getDataInfo(w http.ResponseWriter, r *http.Request) {
	var url = jsURL + "/Traductor2/"

	var decoder = json.NewDecoder(r.Body)
	var c javaFile
	err := decoder.Decode(&c)

	if err != nil {
		panic(err)
	}
	fmt.Println("entro la peticion a go")
	b, err := json.Marshal(c)

	if err != nil {

		fmt.Println("error:", err)

	}

	req, err := http.NewRequest("POST", url, bytes.NewBuffer(b))
	req.Header.Set("Content-Type", "application/json")

	client := &http.Client{}
	resp, err := client.Do(req)

	if err != nil {
		panic(err)
	}

	defer resp.Body.Close()
	bodyBytes, _ := ioutil.ReadAll(resp.Body)

	fmt.Fprintf(w, string(bodyBytes))
}

func getInfo(w http.ResponseWriter, r *http.Request) {
	var url = nodeURL + "/Traductor/"

	fmt.Println("entro peticion a go")
	var decoder = json.NewDecoder(r.Body)
	var c curso
	err := decoder.Decode(&c)

	if err != nil {
		panic(err)
	}

	b, err := json.Marshal(c)

	if err != nil {

		fmt.Println("error:", err)

	}

	req, err := http.NewRequest("POST", url, bytes.NewBuffer(b))
	req.Header.Set("Content-Type", "application/json")

	client := &http.Client{}
	resp, err := client.Do(req)

	if err != nil {
		panic(err)
	}

	defer resp.Body.Close()
	bodyBytes, _ := ioutil.ReadAll(resp.Body)

	//fmt.Println(string(bodyBytes))
	fmt.Fprintf(w, string(bodyBytes))

}

/*TEST FILES*/

var nodeURL = ""
var jsURL = ""

func main() {
	nodeip, defip := os.LookupEnv("NODEJS_IP")
	nodeport, defport := os.LookupEnv("NODEJS_PORT")

	if !defip {
		nodeip = "182.18.7.7"
	}

	if !defport {
		nodeport = "3001"
	}

	nodeURL = "http://" + nodeip + ":" + nodeport

	/*js server*/
	jsip, defip := os.LookupEnv("JS_IP")
	jsport, defport := os.LookupEnv("JS_PORT")

	if !defip {
		jsip = "182.18.7.8"
	}

	if !defport {
		jsport = "3002"
	}

	jsURL = "http://" + jsip + ":" + jsport

	/*GO SERVER*/
	ip, defip := os.LookupEnv("GOLANG_IP")
	port, defport := os.LookupEnv("GOLANG_PORT")

	if !defip {
		ip = "182.18.7.9"
	}

	if !defport {
		port = "8001"
	}

	/*CARGAR TODOS LOS RECURSOS JS CSS AL SERVER */
	http.Handle("/src/", http.StripPrefix("/src/", http.FileServer(http.Dir("src/"))))

	http.HandleFunc("/", index)
	http.HandleFunc("/getInfo", getInfo)
	http.HandleFunc("/getDataInfo", getDataInfo)

	fmt.Println("IP:" + ip + " PORT:" + port)

	http.ListenAndServe(":"+port, nil)
}
