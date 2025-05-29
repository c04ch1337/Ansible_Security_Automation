### install_check.sh ###

#!/bin/bash

# This script checks for Docker and Docker Compose installation

check_command() {
  if ! command -v $1 &> /dev/null
  then
    echo "❌ $1 is not installed. Please install it first."
    exit 1
  else
    echo "✅ $1 is installed."
  fi
}

echo "🔍 Checking dependencies..."
check_command docker
check_command docker-compose

echo "✅ All dependencies are installed."
