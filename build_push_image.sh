#!/bin/bash

# Build docker image, dengan nama item-app dan tag v1
docker build -t item-app:v1 .

# Menampilkan daftar docker images
docker images

# Tag docker image dengan repository GitHub project-pertama-microservices-dicoding
docker tag item-app:v1 ghcr.io/firmansyw30/project-pertama-microservices-dicoding/item-app:v1

# Login Docker ke GitHub Packages via Terminal (Pastikan token sudah dibuat dan melakukan export variable dari token yang didapat).
echo $GHCR_TOKEN | docker login ghcr.io -u firmansyw30 --password-stdin

# Mengunggah image ke GitHub Packages.
docker push ghcr.io/firmansyw30/project-pertama-microservices-dicoding/item-app:v1