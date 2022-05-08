#!/bin/sh
set -e

if [ -z $1 ]; then
    echo "usage: $0 <path to Dockerfile>"
    exit 1
fi

# docker buildx prune -af >&2

file=$1
context=$(dirname $1)
tag=$(echo $RANDOM | md5sum | head -c 20)
docker_tmp=$(mktemp)
start_date=$(date +%s%3N -u)

docker buildx build --no-cache -t $tag -f $file --load $context

end_date=$(date +%s%3N -u)
diff=$(expr $end_date - $start_date)

size=$(docker image inspect $tag | jq .[0].Size | numfmt --to=si --format='%.2f')
docker rmi $tag >&2
# docker buildx prune -af >&2

echo "DONE"
echo $diff"ms"
echo $size
