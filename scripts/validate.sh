#!/bin/bash
set -e

echo "=============== Starting Local Validation ==============="

TEST_OUT=$(pytest ../tests | tail -n 1 | tr -d '=')

echo ${TEST_OUT%in*}
