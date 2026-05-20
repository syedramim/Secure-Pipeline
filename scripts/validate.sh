#!/bin/bash
set -e

pytest

echo "========================================= Running Audit ========================================="

pip-audit -r requirements.txt
