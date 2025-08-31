#!/bin/bash
curl -fsSL https://itunes.apple.com/lookup\?id\=$1 | jq -r '.results[0].bundleId'
