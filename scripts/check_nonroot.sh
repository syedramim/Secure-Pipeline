#!/bin/bash
set -e

echo -e "\nChecking if USER is nonroot..."

docker run -d --name nonroot_check secure_ci_image

USERID=$(docker exec nonroot_check id -u)

docker rm -f nonroot_check

if [ $USERID -eq 0 ]; then
    echo "ERROR: Container is running as root. Failing build." >&2
    exit 1
else
    echo -e "Container is running as: ${USERID}(nonroot).\nBuild ok."
fi