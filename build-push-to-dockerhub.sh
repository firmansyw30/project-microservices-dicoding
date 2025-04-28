#!/bin/bash

# Hentikan eksekusi jika terjadi error
set -e

# Pastikan DOCKERHUB_TOKEN sudah diekspor sebagai variabel lingkungan
if [[ -z "$DOCKERHUB_TOKEN" ]]; then
  echo "Error: DOCKERHUB_TOKEN tidak ditemukan!"
  exit 1
fi

# Tentukan nama image
IMAGE_NAME="firmansyw30/order-service"
TAG="latest"

# Build image dengan nama yang sesuai
echo "🚀 Building Docker image: $IMAGE_NAME:$TAG"
docker build -t $IMAGE_NAME:$TAG .

# Login ke Docker Hub
echo "🔑 Logging in to Docker Hub..."
echo "$DOCKERHUB_TOKEN" | docker login --username firmansyw30 --password-stdin

# Tag image dengan nama yang sesuai
echo "🔖 Tagging image...
docker tag $IMAGE_NAME:$TAG $IMAGE_NAME:$TAG"

# Push image ke Docker Hub
echo "📤 Pushing image to Docker Hub..."
docker push $IMAGE_NAME:$TAG

echo "✅ Done! Image pushed to Docker Hub: $IMAGE_NAME:$TAG"
