#!/bin/bash

set -euo pipefail

terraform fmt -diff -check -recursive .
