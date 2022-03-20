#!/bin/sh
# cross-compile for arm64 and put it in a distroless image
# note: the compilation is done on the host machine, not in a container
# this may lead to better performance and less disk space usage,
# and there's no need for docker cache layer magic to have incremental compilation,
# but requires a working rust toolchain and the `cross` tool

# exit on a falied command
set -e

#! replace this with the name of the rust project
#! also replace APP_NAME in `Dockerfile.arm64`
APP_NAME="hello_rust"

# build the executable and place it in the target directory
cross build --release --target aarch64-unknown-linux-gnu

# create a docker container with the executable
docker buildx build --load --platform linux/arm64 -t "$APP_NAME:latest" -f Dockerfile.arm64 .

# allow copying the image if the script is ran with a user@host argument
if [ ! -z $1 ]; then
    echo "attempting to copy to $1 via ssh"

    # load the resulting image onto the target machine
    docker save hello_rust | pv | ssh "$1" docker load
fi
