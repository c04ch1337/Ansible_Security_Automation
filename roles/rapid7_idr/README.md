# Rapid7 Idr Role

## 📖 Description

Configures rsyslog to forward logs to InsightIDR.

## ▶️ Example Playbook

```yaml
- name: Configure rsyslog for IDR
  hosts: all
  become: yes
  roles:
    - rapid7_idr

```

## 💡 Optional Configuration

- Use Ansible templates to generate the rsyslog.conf dynamically.
- Add TLS support if required.
