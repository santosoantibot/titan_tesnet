#!/bin/bash

# input hash
echo "input hash: "
read -r hash

# Ulangi ke setiap wadah dan jalankan perintah
for i in {1..5}; do
    docker exec -i docker$i bash -c "echo \"$hash\" | titan-edge bind --hash=\$(cat) https://api-test1.container1.titannet.io/api/v2/device/binding"
done
