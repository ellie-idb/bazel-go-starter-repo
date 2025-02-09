#!/usr/bin/env bash
BAZEL="${BAZEL:-bazelisk}"

if [ ! -x bazel-bin/external/gazelle++go_deps+org_golang_x_tools_gopls/gopls_/gopls ]; then
  $BAZEL --quiet build --ui_event_filters=-info,-stdout,-stderr --noshow_progress @org_golang_x_tools_gopls//:gopls 
fi

exec bazel-bin/external/gazelle++go_deps+org_golang_x_tools_gopls/gopls_/gopls "${@}"