#!/bin/bash

# Copyright 2018 Turbine Labs, Inc.
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
# implied. See the License for the specific language governing
# permissions and limitations under the License.

# Exit on any error
set -e
# Exit on undefined env var
set -u
echo $GOOGLE_AUTH | base64 -d > ${HOME}/gcloud-service-key.json
/google-cloud-sdk/bin/gcloud auth activate-service-account --key-file ${HOME}/gcloud-service-key.json
/google-cloud-sdk/bin/gcloud config set project $GCLOUD_PROJECT_ID
/google-cloud-sdk/bin/gcloud --quiet config set container/cluster $GCLOUD_CLUSTER_NAME
/google-cloud-sdk/bin/gcloud config set compute/zone ${GCLOUD_COMPUTE_ZONE}
/google-cloud-sdk/bin/gcloud --quiet container clusters get-credentials $GCLOUD_CLUSTER_NAME
