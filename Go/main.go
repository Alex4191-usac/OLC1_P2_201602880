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

/*TEST FILES*/
func getInfo(w http.ResponseWriter, r *http.Request) {
	var url = nodeURL + "/Curso/"

	fmt.Println("entro al get Info")
	var decoder = json.NewDecoder(r.Body)
	var c curso
	err := decoder.Decode(&c)

	if err != nil {
		panic(err)
	}
	fmt.Println("entro al get Info x3")
	b, err := json.Marshal(c)

	if err != nil {

		fmt.Println("error:", err)

	}
	//var jsonStr = []byte(`{"Nombre":"` + c.Nombre + `"}`)
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

	ip, defip := os.LookupEnv("GOLANG_IP")
	port, defport := os.LookupEnv("GOLANG_PORT")

	if !defip {
		ip = "182.18.7.9"
	}

	if !defport {
		port = "8001"
	}

	http.Handle("/src/", http.StripPrefix("/src/", http.FileServer(http.Dir("src/"))))

	http.HandleFunc("/", index)
	http.HandleFunc("/getInfo", getInfo)

	fmt.Println("Escuchando por IP:" + ip + " PORT:" + port)

	http.ListenAndServe(":"+port, nil)
}
