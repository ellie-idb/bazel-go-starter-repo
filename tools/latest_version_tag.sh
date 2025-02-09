#!/usr/bin/env bash
set -e

git tag -l 'v*' --sort=creatordate |
    perl -nle 'if (/^v\d+\.\d+\.\d+$/) { print $_ }' |
    tail -n1