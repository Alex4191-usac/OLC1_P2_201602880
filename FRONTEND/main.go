package main

import (
	"fmt"
	"net/http"
	"html/template"
	"os"
)


func index(w http.ResponseWriter, r *http.Request){
	template, err := template.ParseFiles("./index.html")

	if err!= nil {
		//ADD 404 PAGE
		fmt.Fprintf(w,"404 page not Found!!!")
	}else{
		template.Execute(w,nil)
	}
}

func main(){

	ip, defip := os.LookupEnv("GOIP")
	port, defport := os.LookupEnv("GOPORT")

	if !defip {
		ip = "182.18.7.9"
	}

	if !defport {
		port = "5000"
	}
	
	http.Handle("/src/", http.StripPrefix("/src/", http.FileServer(http.Dir("src/"))))

	http.HandleFunc("/", index)
	fmt.Println("Escuchando por IP:" + ip + " PORT:" + port)
	http.ListenAndServe(":"+port, nil)

}
