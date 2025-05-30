# Knowbe4 Role

## 📖 Description

Queries KnowBe4 API for user or training campaign data.

## ▶️ Example Playbook

```yaml
- name: Backup KnowBe4 user data
  hosts: localhost
  roles:
    - knowbe4

```

## 💡 Optional Configuration

- Extend with additional endpoints like `/training_campaigns`.
- Encrypt user data output if stored long term.
