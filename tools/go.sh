#!/usr/bin/env bash
BAZEL="${BAZEL:-bazelisk}"
exec $BAZEL --quiet run --ui_event_filters=-info,-stdout,-stderr --noshow_progress @rules_go//go -- "${@}" 2>/dev/null