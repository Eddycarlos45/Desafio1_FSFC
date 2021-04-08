package main

import (
	"net/http"
)

func loadIndex(w http.ResponseWriter, r *http.Request) {
	http.ServeFile(w, r, "index.html")
}

func main() {
	http.HandleFunc("/", loadIndex)
	http.ListenAndServe(":8080", nil)
}
