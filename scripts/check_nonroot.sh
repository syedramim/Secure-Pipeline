#!/bin/bash
set -e

echo "Checking if USER is nonroot..."

docker run -d --name nonroot_check secure_ci_image

USERID=docker exec nonroot_check id

if [ $USERID == 0 ]; then
    echo "ERROR: Container is running as root. Failing build."
    return 1
else
    echo "Container is running as: ${USERID}(nonroot)\nBuild ok."


docker rm -f nonroot_check