//go:build tools
// +build tools

package main

import (
	_ "github.com/golangci/golangci-lint/cmd/golangci-lint"
	_ "golang.org/x/tools/go/analysis"
	_ "golang.org/x/tools/gopls"
	_ "mvdan.cc/gofumpt"
)
