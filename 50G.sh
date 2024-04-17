#!/bin/bash

# Tetapkan perintah yang akan dieksekusi
command="titan-edge config set --storage-size 50GB"

# Ulangi ke setiap wadah dan jalankan perintah
for i in {1..5}; do
    docker exec -i docker$i bash -c "$command"
    
    # Mulai ulang wadah
    docker restart docker$i
done
