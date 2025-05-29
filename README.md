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
