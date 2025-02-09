# bazel-go-starter-repo

This is a monorepo demonstrating a fully worked deployment of Bazel in a Go project, including example CI pipelines, packaging steps, static code analysis, formatting -- the whole 9 yards. 

This project contains one command-line utility "http-server", which is a bare-bones Hello World HTTP server. Said HTTP server is then packaged into a minimal OCI image by Bazel, and can be ran just like any other container image via pushing to a registry, or by loading into your local [Docker, podman] daemon.

This is a heavily simplified version of the monorepo in use at [@devzero-inc](https://github.com/devzero-inc), with most of the DevZero-specific additions removed. Those additions need not apply to most users, unless you're using GOPRIVATE liberally.

## Getting Started
You'll need some form of Bazel, or Bazelisk (a launcher of Bazel -- preferred, as it keeps your Bazel version always up-to-date), and GNU Make installed. After that, you should be able to do the following:
```shell
# replace this with whatever you picked
export BAZEL=bazelisk

make init
```

This will do a couple things:
* build the vendored Go toolchain
* build the vendored version of gopls, to enable support for Bazel
* build the vendored version of golangci-lint
* build the vendored version of gofumpt
* build the entire project from scratch

This helps to speed up IDE analysis start-up times greatly. Otherwise, you'll be waiting for the lock on the Bazel server to be released, which can take a long time, and which may result in inconsistent diagnostics presented within the IDE.

## Running The Server
### Locally - macOS (M1 / arm64)
Make sure you have Docker installed. After that, you can run these commands:
```
bazel run --config=linux-arm64 //cmd/http-server:image.load
docker run --rm -it -p 8080:80 http-server:latest
```
Visit the running server at http://localhost:8080.
### Locally - Linux (amd64 / arm64)
Make sure you have Docker installed. After that, you can run these commands:
```
bazel run //cmd/http-server:image.load
docker run --rm -it -p 8080:80 http-server:latest
```
Visit the running server at http://localhost:8080.


## TODO
* Editor support beyond just VS Code
  - [ ] Neovim
  - [ ] Emacs?
  - [ ] Add your editor here!
* Pushing the produced image up to a remote registry, showing it working on some platform
  * i.e. Cloudflare Workers, Render, whatnot

