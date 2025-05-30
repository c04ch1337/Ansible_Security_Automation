#!/bin/bash

# Load environment variables from .env file

set -a
source .env
set +a

# Run the Ansible playbook with loaded vars
docker run --rm -v $(pwd):/ansible \
  -e RAPID7_API_KEY -e CLOUDFLARE_API_KEY -e MERAKI_API_KEY \
  ansible-local \
  ansible-playbook site.yml -i inventory
