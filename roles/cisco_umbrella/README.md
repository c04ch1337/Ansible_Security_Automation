# Cisco Umbrella Role

## 📖 Description

This role rotates Cisco Umbrella S3 keys and allows testing the login via Umbrella Admin API.

## ▶️ Example Playbook

```yaml
- name: Test Cisco Umbrella API Auth
  hosts: localhost
  gather_facts: no
  roles:
    - cisco_umbrella

```

## 💡 Optional Configuration

- Use the `uri` module to deactivate older keys.
- Base64-encode key:secret manually if required by changes in API.
