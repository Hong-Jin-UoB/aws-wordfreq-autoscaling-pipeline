#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"

export AWS_REGION="${AWS_REGION:-us-east-1}"
: "${WORKER_QUEUE_URL:?Set WORKER_QUEUE_URL to the jobs queue URL}"
: "${WORKER_RESULT_QUEUE_URL:?Set WORKER_RESULT_QUEUE_URL to the results queue URL}"
export WORKER_RESULT_TABLENAME="${WORKER_RESULT_TABLENAME:-wordfreq}"
export WORKER_MESSAGE_VISIBILITY="${WORKER_MESSAGE_VISIBILITY:-200}"

# Run worker in the shell
"${APP_DIR}/bin/application"
