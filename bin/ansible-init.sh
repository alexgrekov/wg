#!/bin/bash

set -e

sudo apt update && sudo apt install -y python3 python3-venv

python3 -m venv .venv

.venv/bin/python3 -m pip install ansible==9.11.0
