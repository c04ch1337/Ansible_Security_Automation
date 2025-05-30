# Rapid7 Vm Role

## 📖 Description

Installs the Rapid7 InsightVM (vulnerability management) agent.

## ▶️ Example Playbook

```yaml
- name: Install InsightVM Agent
  hosts: all
  become: yes
  roles:
    - rapid7_vm

```

## 💡 Optional Configuration

- Token and region can be added via agent config.
- Validate agent connection in the InsightVM console.
