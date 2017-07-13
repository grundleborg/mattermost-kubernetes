#!/bin/bash

sleep ${SLEEP_TIME}m

go tool pprof -svg ${MM_SERVER_URL}:8067/debug/pprof/goroutine > goroutine.svg
go tool pprof -svg ${MM_SERVER_URL}:8067/debug/pprof/block > block.svg
go tool pprof -seconds=300 -svg ${MM_SERVER_URL}:8067/debug/pprof/profile > profile.svg

echo "Posting to: "${RESULTS_CHANNEL_ID}" as "${RESULTS_USERNAME}

mattermost-poster ${MM_RESULTS_SERVER_URL} -a goroutine.svg -a block.svg -a profile.svg -m "Profiling results for "${KUBERNETES_NAME} -c ${RESULTS_CHANNEL_ID} -u ${RESULTS_USERNAME} -p ${RESULTS_PASSWORD}