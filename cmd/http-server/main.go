package main

import (
	"log/slog"
	"net/http"
	"os"
	"os/signal"
)

func main() {
	if err := run(); err != nil {
		slog.Error("caught error", "err", err)
		os.Exit(1)
	}
}

func run() error {
	mux := http.NewServeMux()
	mux.Handle("/", http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		w.WriteHeader(http.StatusOK)
		w.Write([]byte("Hello World!\r\n"))
	}))

	srv := &http.Server{
		Addr:    ":80",
		Handler: mux,
	}
	go slog.Error("serving", "err", srv.ListenAndServe())
	defer srv.Close()

	c := make(chan os.Signal, 1)
	signal.Notify(c, os.Interrupt)
	select {
	case <-c:
	}

	return nil
}
