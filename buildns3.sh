#!/bin/sh
# Script to import the base images to create the RIC containers from Wineslab Docker Hub

# Build image for ns-o-ran

$SUDO docker build -t ns3framework_ns3 -f Dockerfile .

remove_container() {
    $SUDO docker inspect $1 >/dev/null 2>&1
    if [ $? -eq 0 ]; then
        $SUDO docker kill $1
        $SUDO docker rm $1
    fi
}

remove_container ns3framework_ns3
$SUDO docker run -d -it --network=host --name ns3framework_ns3 ns3framework_ns3
$SUDO docker exec -it ns3oran-mmwave /bin/bash
