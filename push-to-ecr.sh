#!/bin/bash

# Load environment variables from .env file
if [ -f .env ]; then
    source .env
    else
      echo ".env file not found"
      exit 1
fi


# Authenticate Docker to ECR
aws ecr --profile $AWS_PROFILE get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com
# Tag the Docker image
docker tag $IMAGE_NAME:$TAG $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$REPOSITORY_NAME:$TAG
# Push the Docker image to ECR
docker push $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$REPOSITORY_NAME:$TAG
