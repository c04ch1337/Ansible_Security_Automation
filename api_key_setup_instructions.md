# 🔑 API Key Setup Instructions for All Roles

This guide provides step-by-step instructions to generate or retrieve API keys and credentials required for each Ansible role in this project.

---

## 🛡️ Cisco Umbrella

🔗 [Umbrella Admin API Guide](https://docs.umbrella.com/umbrella-api/docs)

1. Log in to your Umbrella Dashboard.
2. Go to **Admin > API Keys**.
3. Create a new key for "Umbrella Reporting".
4. Copy:
   - `API Key`
   - `API Secret`
   - `Organization ID` (found under Admin > Organization Info)
5. Store them as environment variables or use `ansible-vault`.

---

## 🛡️ Cisco Meraki

🔗 [Meraki Dashboard API Docs](https://developer.cisco.com/meraki/api-v1/)

1. Log in to your Meraki Dashboard.
2. Click your profile (top right) > **My Profile**.
3. Scroll to **API Access > Generate new API key**.
4. Enable **Dashboard API Access** in Org settings.
5. Save the API key as `MERAKI_API_KEY`.

---

## ☁️ Cloudflare

🔗 [Cloudflare API Tokens](https://developers.cloudflare.com/api/tokens/create/)

1. Go to Cloudflare Dashboard > **My Profile > API Tokens**.
2. Create a new token with `Zone:Read` and `DNS:Read`.
3. Assign to specific zones or accounts.
4. Save as `CLOUDFLARE_API_KEY`.

---

## 🛡️ Rapid7 InsightVM / Nexpose / IDR / Threat Command

🔗 [Rapid7 API Docs](https://docs.rapid7.com/)

1. Log in to your Insight platform (or Nexpose console).
2. Go to **API Credentials** or **User Profile > Manage API Keys**.
3. Generate a key.
4. Store it as `RAPID7_API_KEY`.

- For Nexpose (on-prem), use:
  ```
  https://<nexpose-host>:3780/api/3/
  ```

---

## 🛡️ Zscaler ZIA / ZPA

🔗 [Zscaler API Portal](https://help.zscaler.com/zia/api)

1. Log in to ZIA/ZPA Admin Console.
2. Go to **Administration > API Key Management**.
3. Generate an API key for your account.
4. Note your **username** and **API key**.
5. Use as:
   - `ZSCALER_API_KEY`
   - `ZSCALER_USERNAME` (if required)

---

## 🧠 KnowBe4

🔗 [KnowBe4 API Docs](https://developer.knowbe4.com)

1. Log into your KnowBe4 admin account.
2. Navigate to **Account Settings > API Token**.
3. Copy your `API Token` (v1 or v2).
4. Save it as:
   - `KNOWBE4_API_KEY`

---

## 💡 Tips for All APIs

- 📁 Store in `.env` or Ansible Vault:
  ```env
  RAPID7_API_KEY=your_key
  MERAKI_API_KEY=your_key
  ```

- 🔐 Recommended: use `ansible-vault` to encrypt secrets.

- ✅ Verify key scope: some APIs require you to **explicitly allow access** to each service or data type.

- ❗ Rotate keys regularly and store rotation date.

---

