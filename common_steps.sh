#!/usr/bin/env bash
set -e

[[ -z "$VIRTUAL_ENV" ]] && echo "Refusing to run outside of venv. See README.md." && exit 1

python3 -m pip install -r requirements.txt

# import functions and globals
source url.sh
source helper.sh
source categories.sh

mkdir -p cache/
