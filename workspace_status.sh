#!/bin/bash

# This script will be run bazel when building process starts to
# generate key-value information that represents the status of the
# workspace. The output should be like
#
# KEY1 VALUE1
# KEY2 VALUE2
#
# If the script exits with non-zero code, it's considered as a failure
# and the output will be discarded.

set -eo pipefail # exit immediately if any command fails.

echo "REPO_URL https://github.com/ellie-idb/bazel-go-starter-repo"

commit_sha=$(git rev-parse HEAD)
echo "COMMIT_SHA $commit_sha"

short_commit_sha=$(git rev-parse --short HEAD)
echo "SHORT_COMMIT_SHA $short_commit_sha"

git_branch=$(git rev-parse --abbrev-ref HEAD)
echo "GIT_BRANCH $git_branch"

git_tree_status=$(git diff-index --quiet HEAD -- && echo 'Clean' || echo 'Modified')
echo "GIT_TREE_STATUS $git_tree_status"

time_stamp="$(date +%s)"
echo "VOLATILE_TIME_STAMP $time_stamp"

utc_time_stamp="$(date +%FT%T%z)"
echo "VOLATILE_UTC_TIME_STAMP $utc_time_stamp"

image_timestamp="$(date -u +%Y-%m-%dT%H:%M:%SZ)"
echo "IMAGE_TIMESTAMP $image_timestamp"

# Note: the "STABLE_" suffix causes these to be part of the "stable" workspace
# status, which may trigger rebuilds of certain targets if these values change
# and you're building with the "--stamp" flag.
latest_version_tag=$(./tools/latest_version_tag.sh)
echo "STABLE_VERSION_TAG $latest_version_tag"
echo "STABLE_COMMIT_SHA $commit_sha"