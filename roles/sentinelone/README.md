# Sentinelone Role

## 📖 Description

This role installs the SentinelOne agent using a predefined package URL.

## ▶️ Example Playbook

```yaml
- name: Install SentinelOne Agent
  hosts: all
  become: yes
  roles:
    - sentinelone

```

## 💡 Optional Configuration

- Replace the agent URL with one specific to your tenant.
- Include site token as part of agent config if supported.
