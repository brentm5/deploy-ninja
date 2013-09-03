#!/bin/sh

deploy_ninja_host='http://deploy-ninja.dev'
tag='deploy-ninja-application'

#DO NOT EDIT BELOW THIS LINE
echo 'Beginning to report the deploy'

commit=$(git rev-parse HEAD)
branch=$(git rev-parse --abbrev-ref HEAD)

curl -v -H "Accept: application/json" \
-H "Content-type: application/json" \
-X POST \
-d "{\"tag\":\"${tag}\",\"branch\":\"${branch}\",\"commit\":\"${commit}\",\"success\":\"true\"}" \
$deploy_ninja_host/deployments/new

echo 'Deploy reported to host'
