
#!/bin/bash

# Download code base
git clone https://github.com/santosoantibot/titan_tesnet.git 
cd titan_tesnet/

# Give execution permission to script file
chmod +x install_docker.sh setup_docker_containers.sh

# Install Docker
sudo ./install_docker.sh

# Set up Docker container
sudo ./setup_docker_containers.sh

# Set up Docker container 50G
command="titan-edge config set --storage-size 50GB"

# Loop into each container and execute the command
for i in {1..5}; do
    docker exec -i docker$i bash -c "$command"
    
    # 重啟容器
    docker restart docker$i
done
