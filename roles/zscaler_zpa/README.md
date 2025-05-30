# Zscaler Zpa Role

## 📖 Description

Installs the Zscaler Private Access (ZPA) connector agent.

## ▶️ Example Playbook

```yaml
- name: Install ZPA Connector
  hosts: all
  become: yes
  roles:
    - zscaler_zpa

```

## 💡 Optional Configuration

- Use tokens or org ID injection into the installer path.
- Validate ZPA health from admin console.
