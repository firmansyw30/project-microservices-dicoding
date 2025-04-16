#!/bin/bash

# Build docker image, dengan nama karsajobs-ui dan tag latest
docker build -t karsajobs-ui:latest .

# # Menampilkan daftar docker images
# docker images

# # Tag docker image dengan repository GitHub project-microservices-dicoding
# docker tag karsajobs-ui:latest ghcr.io/firmansyw30/project-microservices-dicoding/karsajobs-ui:latest

# Login Docker ke GitHub Packages via Terminal (Pastikan token sudah dibuat dan melakukan export variable dari token yang didapat).
echo $GHCR_TOKEN | docker login ghcr.io -u firmansyw30 --password-stdin

# Mengunggah image ke GitHub Packages.
docker push ghcr.io/firmansyw30/project-microservices-dicoding/karsajobs-ui:latest