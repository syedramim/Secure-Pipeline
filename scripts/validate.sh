#!/bin/bash
set -e

pytest

pip-audit
