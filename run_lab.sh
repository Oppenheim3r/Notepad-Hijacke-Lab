#!/bin/bash
# Notepad++ Update Hijack Lab SSL - Run Script

IMAGE_NAME="npp-hijack-lab-ssl"
CONTAINER_NAME="npp-lab-server"

echo "[*] Building Docker image with SSL support..."
docker build -t $IMAGE_NAME .

# Check if a container with the same name is already running
if [ "$(docker ps -aq -f name=$CONTAINER_NAME)" ]; then
    echo "[*] Removing existing container..."
    docker rm -f $CONTAINER_NAME
fi

echo "[*] Starting lab container on ports 80 and 443 (HTTPS enabled)..."
docker run -d \
    --name $CONTAINER_NAME \
    -p 80:80 \
    -p 443:443 \
    $IMAGE_NAME

echo "[+] Lab server is now running with SSL!"
echo "[!] Your Server IP is: $(hostname -I | awk '{print $1}')"
echo ""
echo "[!] IMPORTANT: Add the following to your Windows hosts file:"
echo "$(hostname -I | awk '{print $1}')  notepad-plus-plus.org"
echo "$(hostname -I | awk '{print $1}')  npp-lab-server"
