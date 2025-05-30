# Crowdstrike Role

## 📖 Description

This role installs and configures the CrowdStrike Falcon sensor on the target machine.

## ▶️ Example Playbook

```yaml
- name: Install CrowdStrike Falcon
  hosts: all
  become: yes
  roles:
    - crowdstrike

```

## 💡 Optional Configuration

- Use a local RPM instead of downloading it if operating offline.
- Validate sensor registration with the Falcon UI.
