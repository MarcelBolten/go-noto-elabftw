#!/usr/bin/env bash
set -e

[[ -z "$VIRTUAL_ENV" ]] && echo "Refusing to run outside of venv. See README.md." && exit 1

python -m pip install -U pip
python -m pip install -r requirements.txt

# import functions and globals
source scripts/url.sh
source scripts/helper.sh
source scripts/categories.sh

mkdir -p cache/ fonts/

download_tools
