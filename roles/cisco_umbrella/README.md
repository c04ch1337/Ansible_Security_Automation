# Cisco Umbrella Role

## 📖 Description

This role manages Cisco Umbrella integration and automation, including:

- 🔐 Rotating Umbrella API keys used for S3 logging
- 🔄 Updating API credentials in Rapid7 IDR
- 📡 Verifying login to the Umbrella Admin API

---

## ▶️ Playbooks Included

### `main.yml`
- Tests API connectivity to Umbrella and retrieves organization information.

### `rotate_and_update_idr.yml`
- Full workflow:
  1. Stops Cisco Umbrella event source in IDR.
  2. Rotates API/Secret keys in Umbrella.
  3. Updates IDR source with new credentials.
  4. Restarts the IDR event source.

---

## 🔐 Required Environment Variables

```env
UMBRELLA_API_KEY=your_umbrella_api_key
UMBRELLA_API_SECRET=your_umbrella_api_secret
UMBRELLA_ORG_ID=your_umbrella_organization_id
IDR_API_KEY=your_idr_api_key
```

---

## 🔧 Example Usage

```yaml
- name: Rotate and Update Umbrella Key in IDR
  hosts: localhost
  gather_facts: no
  tasks:
    - import_tasks: roles/cisco_umbrella/tasks/rotate_and_update_idr.yml
```

---

## 💡 Optional Enhancements

- 🧪 Validate old keys before removal
- 🔔 Notify via Slack/email on success/failure
- 📅 Schedule monthly with cron or Jenkins
