# Meraki Role

## 📖 Description

Fetches device info from a Cisco Meraki network using their Dashboard API.

## ▶️ Example Playbook

```yaml
- name: Backup Meraki device inventory
  hosts: localhost
  roles:
    - meraki

```

## 💡 Optional Configuration

- Query `/organizations/{org_id}/networks` to auto-loop devices.
- Store backups in central server or ticketing system.
