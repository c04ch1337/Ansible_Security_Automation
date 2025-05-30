# Cloudflare Role

## 📖 Description

Backs up DNS records from Cloudflare using their API.

## ▶️ Example Playbook

```yaml
- name: Download DNS records from Cloudflare
  hosts: localhost
  roles:
    - cloudflare

```

## 💡 Optional Configuration

- Use pagination for >1000 records.
- Loop through multiple zones via the `/zones` endpoint.
