#!/bin/bash

cmd="docker"

# Check if Docker is installed
if ! command -v $cmd &> /dev/null
then
    echo "The '$cmd' engine is not installed. Please install it and try again."
    exit 1
fi

echo "Using $(command -v docker) to build the LaTeX document."

docker build --output type=local,dest=. --target pdf -f build/Containerfile .