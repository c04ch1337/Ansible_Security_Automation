# 🛠️ Ansible in Docker (Red Hat UBI9 Base)

This project sets up an Ansible container based on Red Hat's UBI9 image. It's intended for Security teams managing tools like CrowdStrike, SentinelOne, Zscaler, Rapid7, and KnowBe4.

---

## 📁 Project Contents

- `Dockerfile` — Red Hat UBI9 with Ansible
- `docker-compose.yml` — For Portainer or Docker Compose
- `install_check.sh` — Checks for Docker + Compose
- `/playbooks` — Prebuilt security tool playbooks

---

## 🐳 Docker Build & Run

```bash
docker build -t ansible-local .
docker run -it --rm \
  -v $(pwd)/playbooks:/ansible \
  -v ~/.ssh:/root/.ssh:ro \
  ansible-local

---

## ▶️ Portainer Stack

```yml
version: '3.8'

services:
  ansible:
    container_name: ansible
    image: ansible-local:latest
    stdin_open: true
    tty: true
    build: .
    volumes:
      - ./playbooks:/ansible
      - ~/.ssh:/root/.ssh:ro
    environment:
      - ANSIBLE_HOST_KEY_CHECKING=False
    working_dir: /ansible
    restart: unless-stopped

---

## 📜 Dependency Check

```bash
chmod +x install_check.sh
./install_check.sh

---

## 🧪 Running Playbooks

```bash
ansible-playbook playbooks/crowdstrike.yml -i inventory

---

## 🔒 Security Tool Playbooks

```bash
* crowdstrike.yml
* sentinelone.yml
* cisco_umbrella.yml
* rapid7_vm.yml
* rapid7_idr.yml
* rapid7_threat_command.yml
* zscaler_zpa.yml
* zscaler_zia.yml
* knowbe4.yml



---

## 📂 Example Playbook: `playbooks/crowdstrike.yml`

```yaml
---
- name: Example - CrowdStrike Sensor Deployment
  hosts: all
  become: yes
  tasks:
    - name: Download CrowdStrike sensor
      get_url:
        url: "https://download.crowdstrike.com/sensor"
        dest: "/tmp/falcon-sensor.rpm"

    - name: Install Falcon sensor
      yum:
        name: /tmp/falcon-sensor.rpm
        state: present

    - name: Ensure Falcon sensor is running
      service:
        name: falcon-sensor
        state: started
        enabled: yes


Repeat that format for the rest of the playbooks:

    Replace crowdstrike.yml in the above with:

* sentinelone.yml
* cisco_umbrella.yml
* rapid7_vm.yml
* rapid7_idr.yml
* rapid7_threat_command.yml
* zscaler_zpa.yml
* zscaler_zia.yml
* knowbe4.yml

Each one follows the same pattern with custom URLs, services, or API calls.

---
