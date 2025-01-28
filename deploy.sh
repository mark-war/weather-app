#!/bin/bash

# Variables
DOCKER_USERNAME="war0404"
IMAGE_TAG=$GITHUB_SHA  # Use GITHUB_SHA for the tag, or set it manually

# Log in to Docker Hub
echo "Logging in to Docker Hub..."
docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD

# Pull the latest Docker image (replace with the actual commit SHA)
echo "Pulling the latest Docker image..."
docker pull $DOCKER_USERNAME/weather-app:$IMAGE_TAG

# Stop and remove the existing container if it exists
echo "Stopping and removing the existing container..."
docker stop weather-app || true
docker rm weather-app || true

# Run the new container
echo "Running the new container..."
docker run -d --name weather-app -p 5173:5173 $DOCKER_USERNAME/weather-app:$IMAGE_TAG
