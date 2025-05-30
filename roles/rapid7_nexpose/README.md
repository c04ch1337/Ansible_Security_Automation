# Rapid7 Nexpose Role

## 📖 Description

Pulls configuration of sites from the Nexpose API (InsightVM on-prem).

## ▶️ Example Playbook

```yaml
- name: Backup Nexpose Sites
  hosts: localhost
  roles:
    - rapid7_nexpose

```

## 💡 Optional Configuration

- Backup individual site data using site IDs.
- Rotate API keys regularly and use environment variable injection.
