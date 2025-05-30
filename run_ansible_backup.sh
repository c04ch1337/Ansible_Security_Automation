#!/bin/bash

# Run this with `crontab -e` to schedule it manually

# Example Cron (run daily at 1am):
# 0 1 * * * /path/to/run_ansible_backup.sh

cd /path/to/ansible_docker
export RAPID7_API_KEY="your_key"
export CLOUDFLARE_API_KEY="your_key"
export MERAKI_API_KEY="your_key"

docker run --rm -v $(pwd):/ansible   -e RAPID7_API_KEY -e CLOUDFLARE_API_KEY -e MERAKI_API_KEY   ansible-local   ansible-playbook site.yml -i inventory
