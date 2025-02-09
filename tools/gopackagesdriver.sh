#!/usr/bin/env bash
# See https://github.com/bazelbuild/rules_go/wiki/Editor-setup#3-editor-setup
exec bazelisk --quiet run --ui_event_filters=-info,-stdout,-stderr --noshow_progress @rules_go//go/tools/gopackagesdriver -- "${@}"
