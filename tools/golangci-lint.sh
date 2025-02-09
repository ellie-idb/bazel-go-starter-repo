#!/usr/bin/env bash
BAZEL="${BAZEL:-bazelisk}"

if [ ! -x bazel-bin/external/gazelle++go_deps+cc_mvdan_gofumpt/gofumpt_/gofumpt ]; then
  $BAZEL --quiet build --ui_event_filters=-info,-stdout,-stderr --noshow_progress //:gofumpt
fi

if [ ! -x bazel-bin/external/gazelle++go_deps+com_github_golangci_golangci_lint/cmd/golangci-lint/golangci-lint_/golangci-lint ]; then
  $BAZEL --quiet build --ui_event_filters=-info,-stdout,-stderr --noshow_progress //:golangci-lint
fi

export PATH="$(pwd)/bazel-bin/external/gazelle++go_deps+com_github_golangci_golangci_lint/cmd/golangci-lint/golangci-lint_:$(pwd)/bazel-bin/external/gazelle++go_deps+cc_mvdan_gofumpt/gofumpt_:$PATH"
export GOROOT=bazel-bazel-go-starter-repo/external/rules_go++go_sdk+main___download_0
golangci-lint version
exec golangci-lint "${@}"