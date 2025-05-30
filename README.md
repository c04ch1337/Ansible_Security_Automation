# 🛠️ Ansible Security Automation in Docker (Red Hat UBI9 Base)

This project sets up an Ansible container based on Red Hat's UBI9 image. It's intended for Security teams managing tools like CrowdStrike, SentinelOne, Zscaler, Rapid7, and KnowBe4.

## 🐳 Docker Build & Run

```bash
docker build -t ansible-local .
docker run -it --rm \
  -v $(pwd)/playbooks:/ansible \
  -v ~/.ssh:/root/.ssh:ro \
  ansible-local
```

## ▶️ Portainer Stack

See docker-compose.yml for stack setup.

## 📜 Dependency Check

```bash
chmod +x install_check.sh
./install_check.sh
```

## 🧪 Running Playbooks

```bash
ansible-playbook site.yml -i inventory
```

## 🔒 API Key Management

Set API keys using environment variables:

```bash
export KNOWBE4_API_KEY="..."
export RAPID7_API_KEY="..."
export ZSCALER_API_KEY="..."
```

## 🗂️ Role-Based Directory Structure

Each security tool now has its own Ansible role under:

```
roles/
├── crowdstrike/
├── sentinelone/
├── cisco_umbrella/
├── rapid7_vm/
├── rapid7_idr/
├── rapid7_threat_command/
├── zscaler_zpa/
├── zscaler_zia/
└── knowbe4/
```

Each role includes a `tasks/main.yml` with a placeholder task for now. You can replace these with the appropriate playbook logic.

---

## 📄 site.yml

This file includes all roles:

```yaml
---
- hosts: all
  become: yes
  roles:
    - crowdstrike
    - sentinelone
    - cisco_umbrella
    - rapid7_vm
    - rapid7_idr
    - rapid7_threat_command
    - zscaler_zpa
    - zscaler_zia
    - knowbe4
```

Run it with:

```bash
ansible-playbook site.yml -i inventory
```

---

## 🔐 API Key Management with Environment Variables

**File:** `group_vars/all.yml`

```yaml
---
# Environment variable-based API key loading
knowbe4_api_key: "{{ lookup('env', 'KNOWBE4_API_KEY') }}"
rapid7_api_key: "{{ lookup('env', 'RAPID7_API_KEY') }}"
zscaler_api_key: "{{ lookup('env', 'ZSCALER_API_KEY') }}"
```

You can securely inject these into your container:

```bash
docker run -it --rm \
  -e KNOWBE4_API_KEY="your_key" \
  -e RAPID7_API_KEY="your_key" \
  -e ZSCALER_API_KEY="your_key" \
  -v $(pwd)/playbooks:/ansible \
  -v ~/.ssh:/root/.ssh:ro \
  ansible-local
```
