#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e6bad55ed8499001439293e/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e6bad55ed8499001439293e
curl -s -X POST https://api.stackbit.com/project/5e6bad55ed8499001439293e/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5e6bad55ed8499001439293e/webhook/build/publish > /dev/null
