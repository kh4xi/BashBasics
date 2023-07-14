#!/bin/bash

# Check if the command argument is provided
if [ $# -eq 0 ]; then
  echo "Error: No command provided."
  echo "Usage: ./run_command.sh <command>"
  exit 1
fi

# Get the command from the argument
command="$@"

# Check if the command is "start" and execute the Docker command
if [ "$command" = "start" ]; then
  docker run -p 8080:8080 -p 9090:9090 -p 80:8888 -e TZ=Europe/Amsterdam webgoat/goatandwolf:latest
elif [ "$command" = "stop" ]; then
  # Get the running container ID
  container_id=$(docker ps -q --filter ancestor=webgoat/goatandwolf:latest)

  # Check if a container is running
  if [ -z "$container_id" ]; then
    echo "No running container found."
  else
    # Stop the container
    docker stop "$container_id"
    echo "Container stopped: $container_id"
  fi
else
  # Execute any other command
  eval "$command"
fi
