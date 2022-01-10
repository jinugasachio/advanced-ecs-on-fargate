#!/bin/bash

set -euo pipefail

terragrunt run-all validate --terragrunt-non-interactive
