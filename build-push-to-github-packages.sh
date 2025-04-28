#!/bin/bash

# Hentikan eksekusi jika terjadi error
set -e

# Pastikan GHCR_TOKEN sudah diekspor sebagai variabel lingkungan
if [[ -z "$GHCR_TOKEN" ]]; then
  echo "Error: GHCR_TOKEN tidak ditemukan!"
  exit 1
fi

# Tentukan nama image full (sesuai dengan struktur di GHCR)
USERNAME="firmansyw30"
REPO="project-microservices-dicoding"
SERVICE="shipping-service"
TAG="latest"

FULL_IMAGE_NAME="ghcr.io/$USERNAME/$REPO/$SERVICE:$TAG"

# Build image dengan nama yang sesuai
echo "🚀 Building Docker image: $FULL_IMAGE_NAME"
docker build -t $FULL_IMAGE_NAME .

# Login ke GitHub Container Registry
echo "🔑 Logging in to GitHub Container Registry..."
echo "$GHCR_TOKEN" | docker login ghcr.io -u $USERNAME --password-stdin

# Push image ke GitHub Container Registry
echo "📤 Pushing image to GitHub Container Registry: $FULL_IMAGE_NAME"
docker push $FULL_IMAGE_NAME

echo "✅ Done! Image pushed to GitHub Container Registry: $FULL_IMAGE_NAME"
