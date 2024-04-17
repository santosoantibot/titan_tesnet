#!/bin/bash

# Step 1: Download the image
docker pull nezha123/titan-edge

# Step 2: Create storage volume
mkdir -p ~/.titanedge1
mkdir -p ~/.titanedge2
mkdir -p ~/.titanedge3
mkdir -p ~/.titanedge4
mkdir -p ~/.titanedge5

# Step 3: Run five Docker containers, each using different storage volumes
docker run -d -v ~/.titanedge1:/root/.titanedge --name docker1 nezha123/titan-edge
sleep 5  # wait 5 seconds
docker run -d -v ~/.titanedge2:/root/.titanedge --name docker2 nezha123/titan-edge
sleep 5  # wait 5 seconds
docker run -d -v ~/.titanedge3:/root/.titanedge --name docker3 nezha123/titan-edge
sleep 5  # wait 5 seconds
docker run -d -v ~/.titanedge4:/root/.titanedge --name docker4 nezha123/titan-edge
sleep 5  # wait 5 seconds
docker run -d -v ~/.titanedge5:/root/.titanedge --name docker5 nezha123/titan-edge
sleep 5  # wait 5 seconds

# Step 4: Prompt the user to enter hash
echo "masukan hash: "
read -r hash

# Loop into each container and execute the command
for i in {1..5}; do
    docker exec -i docker$i bash -c "echo \"$hash\" | titan-edge bind --hash=\$(cat) https://api-test1.container1.titannet.io/api/v2/device/binding"
done
