#!/bin/bash
#
# Get the App Store bundle ID for a given app ID.
#
# Usage:
#   ./get_bundle_id.sh <app_id>
#   curl -fsSL https://github.com/mininit/bash-utilities/raw/HEAD/get_bundle_id.sh | bash -s <app_id>
#
# Example:
#   Navigate to the app page, e.g.:
#     https://apps.apple.com/us/app/google-chrome/id535886823
#   Extract the numeric ID from the URL (535886823 in this case)
#     ./get_bundle_id.sh 535886823
#
set -e
curl -fsSL "https://itunes.apple.com/lookup?id=$1" | jq -r '.results[0].bundleId'