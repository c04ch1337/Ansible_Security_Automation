# Zscaler Zia Role

## 📖 Description

Configures syslog to forward logs to Zscaler Internet Access (ZIA).

## ▶️ Example Playbook

```yaml
- name: Configure Syslog for ZIA
  hosts: all
  become: yes
  roles:
    - zscaler_zia

```

## 💡 Optional Configuration

- Add TLS or use a remote log forwarder.
- Template your rsyslog.conf to manage multiple destinations.
