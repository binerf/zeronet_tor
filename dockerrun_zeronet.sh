#!/bin/sh
#
docker run -d -v /mnt/docker/zeronet:/root/data -p 15441:15441 -p 43110:43110 binerf/zeronet_tor
