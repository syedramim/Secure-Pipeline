#!/bin/bash
set -e

pytest

pip-audit -r requirements.txt
