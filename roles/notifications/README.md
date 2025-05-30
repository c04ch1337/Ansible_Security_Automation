# Notifications Role

## 📖 Description

The `notifications` role provides automated messaging functionality for sending alerts, summaries, or backup status updates to external services such as:

- Email
- Slack
- Microsoft Teams
- Webhooks

It can be used to notify system admins or teams of Ansible job results, backup completions, or failures.

---

## ▶️ Example Playbook Usage

```yaml
- name: Send Backup Notification
  hosts: localhost
  gather_facts: no
  roles:
    - notifications
```

---

## 🔔 Supported Notifications (Examples)

- **Email:**
  Use the `mail` module with `localhost` or SMTP relay.

- **Slack:**
  ```yaml
  - name: Send Slack message
    uri:
      url: "https://hooks.slack.com/services/your/webhook/url"
      method: POST
      body_format: json
      body:
        text: "Ansible backup completed successfully."
  ```

- **Microsoft Teams:**
  Similar to Slack, use Teams Incoming Webhooks.

- **Custom Webhook:**
  ```yaml
  - name: Trigger external service via webhook
    uri:
      url: "https://your-api/notify"
      method: POST
      body:
        message: "Backup job complete"
      headers:
        Content-Type: "application/json"
  ```

---

## 💡 Optional Configuration

- Add `when` conditionals to send alerts only on failure or success
- Include Ansible facts or `ansible_date_time` in your message body
- Chain with `rescue` blocks for error alerting

---

## 🔐 Security Tips

- Avoid hardcoding webhook URLs or email credentials
- Use Ansible Vault for sensitive variables

---

## 📦 Related Modules

- `mail`
- `uri`
- `slack`
- `community.general.sendgrid`
- `ansible.builtin.debug`
