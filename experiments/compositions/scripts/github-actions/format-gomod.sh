#!/bin/bash

# Copyright 2022 The Kubernetes Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


# CI script to keep all our go.mod/go.sum updated

set -o errexit
set -o nounset
set -o pipefail

# cd to the repo root
REPO_ROOT=$(git rev-parse --show-toplevel)
BASE_DIR=${REPO_ROOT}/experiments/compositions
cd "${BASE_DIR}"/composition
go version
go mod tidy

cd "${BASE_DIR}"/expanders/cel-expander
go version
go mod tidy

cd "${BASE_DIR}"/expanders/helm-expander
go version
go mod tidy