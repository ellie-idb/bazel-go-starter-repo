BAZEL ?= bazel

.PHONY: fmt
fmt:
	./tools/gofumpt.sh -w .

.PHONY: tidy
tidy:
	$(BAZEL) run @rules_go//go mod tidy
	$(BAZEL) mod tidy
	$(BAZEL) run //:gazelle

.PHONY: init
### Set up your local environment for developing on this monorepo.
init:
	$(BAZEL) build @rules_go//go:toolchain && \
	$(BAZEL) build @org_golang_x_tools_gopls//:gopls && \
	$(BAZEL) build //:golangci-lint && \
	$(BAZEL) build //:gofumpt && \
	$(BAZEL) build //...

.PHONY: lint
lint:
	./tools/golangci-lint.sh run --new --config .golangci.yml

.PHONY: nogo
nogo:
	$(BAZEL) build --keep_going --run_validations //...

.PHONY: gopls
gopls:
	$(BAZEL) build @org_golang_x_tools_gopls//:gopls
