#!/bin/sh

if [ $# -ne 1 ]; then
 >&2 echo "Inappropriate number of args. Only 1 is needed."
exit 1;
fi

docker run --rm \
-it \
--device=/dev/kvm  \
-e host_ip=127.0.0.1 \
--network=host \
--privileged \
--mount type=bind,source="${PWD}/${1}",target=/root \
-w /root \
cuttlefish-complete:latest sh -c "./bin/launch_cvd --start_webrtc"

