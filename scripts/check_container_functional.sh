#!/bin/bash
set -e

docker run -d -p 8000:8000 --name health_check secure_ci_image

sleep 5s

STATUS=$(curl -s http://localhost:8000/health | jq -r '.status')

docker rm -f health_check

if [ "$STATUS" = "healthy" ]; then
    echo "Service Functional"
else
    echo "Service not working"
    exit 1
fi