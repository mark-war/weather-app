#!/bin/bash

# Load environment variables from .env file
set -a
source .env
set +a

# Check if a tag is provided as an argument, otherwise use 'latest'
IMAGE_TAG=${1:-latest}  # Default to 'latest' if no argument is provided

# Stop and remove the existing container if it exists
if [ $(docker ps -aq -f name=weather-app) ]; then
  echo "Stopping and removing the existing container..."
  docker stop weather-app || true
  docker rm weather-app || true
fi

# Log in to Docker Hub
echo "Logging in to Docker Hub..."
echo $DOCKER_PASSWORD | docker login --username $DOCKER_USERNAME --password-stdin

# Pull the latest Docker image from Docker Hub
echo "Pulling the latest Docker image..."
docker pull $DOCKER_USERNAME/weather-app:$IMAGE_TAG

# Run the new container with the updated image
echo "Running the new container..."
docker run -d --name weather-app -p 5173:5173 $DOCKER_USERNAME/weather-app:$IMAGE_TAG
