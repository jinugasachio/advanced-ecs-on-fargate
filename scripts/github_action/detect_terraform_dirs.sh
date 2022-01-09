#!/bin/bash

set -euo pipefail

find . -type f -name "*.tf" | xargs -I {} dirname {} | awk '!a[$0]++{print}'
