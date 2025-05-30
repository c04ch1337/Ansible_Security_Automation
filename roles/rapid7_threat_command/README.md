# Rapid7 Threat Command Role

## 📖 Description

Fetches threat intelligence data from the Rapid7 Threat Command API.

## ▶️ Example Playbook

```yaml
- name: Pull threat alerts from Threat Command
  hosts: localhost
  roles:
    - rapid7_threat_command

```

## 💡 Optional Configuration

- Modify API URI to filter data.
- Store results securely in S3 or internal systems.
