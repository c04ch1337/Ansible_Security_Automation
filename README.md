# 🛠️ Ansible in Docker for Security Teams (Red Hat UBI9)

This project is a full-featured Ansible environment built in Docker using Red Hat's UBI9 base image. It includes automation playbooks and roles to manage and back up security configurations and telemetry from popular security tools.

---

## 📦 Features

- ✅ Dockerized Ansible with Red Hat UBI9
- ✅ Role-based playbook structure
- ✅ Secure API key management using environment variables
- ✅ Backup automation for:
  - CrowdStrike
  - SentinelOne
  - Cisco Umbrella
  - Rapid7 InsightVM
  - Rapid7 InsightIDR
  - Rapid7 Threat Command
  - Rapid7 Nexpose
  - Zscaler ZPA
  - Zscaler ZIA
  - KnowBe4
  - Cloudflare
  - Cisco Meraki (Remote Sites)

---

## 📁 Project Structure

```
.
├── Dockerfile
├── docker-compose.yml
├── install_check.sh
├── site.yml
├── group_vars/
│   └── all.yml
├── playbooks/         # Optionally used for custom playbooks
└── roles/
    ├── crowdstrike/
    ├── sentinelone/
    ├── cisco_umbrella/
    ├── rapid7_vm/
    ├── rapid7_idr/
    ├── rapid7_threat_command/
    ├── rapid7_nexpose/
    ├── zscaler_zpa/
    ├── zscaler_zia/
    ├── knowbe4/
    ├── cloudflare/
    └── meraki/
```

---

## 🐳 Build and Run

### 🛠️ Build the Docker Image

```bash
docker build -t ansible-local .
```

### ▶️ Run Ansible Container

```bash
docker run -it --rm \
  -e KNOWBE4_API_KEY="..." \
  -e RAPID7_API_KEY="..." \
  -e ZSCALER_API_KEY="..." \
  -e CLOUDFLARE_API_KEY="..." \
  -e MERAKI_API_KEY="..." \
  -v $(pwd)/roles:/ansible/roles \
  -v ~/.ssh:/root/.ssh:ro \
  ansible-local
```

---

## 📋 Docker Compose / Portainer Stack

```yaml
version: '3.8'

services:
  ansible:
    container_name: ansible
    image: ansible-local:latest
    stdin_open: true
    tty: true
    build: .
    volumes:
      - ./roles:/ansible/roles
      - ~/.ssh:/root/.ssh:ro
    environment:
      - ANSIBLE_HOST_KEY_CHECKING=False
      - KNOWBE4_API_KEY=${KNOWBE4_API_KEY}
      - RAPID7_API_KEY=${RAPID7_API_KEY}
      - ZSCALER_API_KEY=${ZSCALER_API_KEY}
      - CLOUDFLARE_API_KEY=${CLOUDFLARE_API_KEY}
      - MERAKI_API_KEY=${MERAKI_API_KEY}
    working_dir: /ansible
    restart: unless-stopped
```

---

## 📜 Dependency Check Script

Run this to verify you have Docker and Docker Compose installed:

```bash
chmod +x install_check.sh
./install_check.sh
```

---

## 🚀 Execute Backups

Run all roles defined in `site.yml`:

```bash
ansible-playbook site.yml -i inventory
```

All outputs will be stored in the `/ansible/backups` directory.

---

## 🔐 API Key Management

Use environment variables injected at container run time, or define them in `.env` when using Docker Compose.

### Example `group_vars/all.yml`

```yaml
---
knowbe4_api_key: "{{ lookup('env', 'KNOWBE4_API_KEY') }}"
rapid7_api_key: "{{ lookup('env', 'RAPID7_API_KEY') }}"
zscaler_api_key: "{{ lookup('env', 'ZSCALER_API_KEY') }}"
cloudflare_api_key: "{{ lookup('env', 'CLOUDFLARE_API_KEY') }}"
meraki_api_key: "{{ lookup('env', 'MERAKI_API_KEY') }}"
```

---

## 📤 Backed Up Data

The following items are backed up:

- Sensor configs
- rsyslog settings
- API-fetched user and site data
- DNS records (Cloudflare)
- Meraki device configuration snapshots
- JSON outputs from APIs saved under `/ansible/backups`

---

## 🆕 Cisco Umbrella + Rapid7 IDR Integration

- New playbook: `rotate_and_update_idr.yml`
- Automates key rotation and Rapid7 credential sync
- See `roles/cisco_umbrella/README.md` for usage

---

## 📌 Next Steps

- [ ] Add encryption for backup files
- [ ] Push to remote storage (e.g., AWS S3)
- [ ] Set up automated scheduling via cron inside a persistent container
