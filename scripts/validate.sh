#!/bin/bash
set -e

pytest

pip list --format=json

pip-audit
