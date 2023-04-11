package main

import (
	"net/http"
)

func Handler(w http.ResponseWriter, r *http.Request) {
	msg := "Hello Go, For the cold start test.\n"
	w.Write([]byte(msg))
}