#!/bin/sh
set -eu

if [ -z ${GITHUB_TOKEN+x} ]; then
	echo "Please set the GITHUB_TOKEN environment variable!"
	exit 1
fi

gh codeql github upload-results \
	--repository "$(gh repo view --json nameWithOwner | jq -r '.nameWithOwner')" \
	--ref "refs/heads/$(git branch --show-current)" \
	--commit "$(git rev-parse HEAD)" \
	--sarif ./code-results.sarif
