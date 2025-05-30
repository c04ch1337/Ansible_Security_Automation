# 🛠️ Ansible in Docker (Red Hat UBI9 Base)

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
