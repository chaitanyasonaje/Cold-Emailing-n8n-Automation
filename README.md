# ⚡ Automated Cold Email & Outreach Engine

[![n8n](https://img.shields.io/badge/Engine-n8n-FF6D5A?style=for-the-badge&logo=n8n&logoColor=white)](https://n8n.io)
[![Docker](https://img.shields.io/badge/Environment-Docker%20Desktop-2496ED?style=for-the-badge&logo=docker&logoColor=white)](https://docker.com)
[![Microsoft 365](https://img.shields.io/badge/Integration-OneDrive%20%26%20Outlook-0078D4?style=for-the-badge&logo=microsoftoutlook&logoColor=white)](https://microsoft.com)
[![Database](https://img.shields.io/badge/Database-SQLite-003B57?style=for-the-badge&logo=sqlite&logoColor=white)](https://sqlite.org)

An enterprise-grade, self-hosted **automated cold email outreach pipeline** built on **n8n** and **Docker Desktop**. This system automates lead extraction, dynamic email personalization, anti-spam template rotation, and email dispatch via Microsoft Outlook.

---

## 🌟 Why Use This Setup?

Commercial outreach tools (like Lemlist, Instantly, or Zapier) charge high monthly subscriptions and cap monthly tasks. This self-hosted engine offers:

* 🚀 **Zero Monthly Platform Fees**: Unlimited workflow executions with 100% self-hosted infrastructure.
* 🛡️ **Total Data Privacy**: All lead records, API tokens, and credentials remain stored locally in your encrypted SQLite database.
* 🎲 **Anti-Spam Template Rotation**: Randomly selects email variations to avoid deliverability penalties and spam filters.
* 🎯 **Smart Lead State Management**: Automatically filters out leads marked as `SENT` to prevent duplicate emails.
* 📊 **Seamless Microsoft 365 Sync**: Pulls lead lists dynamically from OneDrive Excel files and dispatches emails directly through Outlook.

---

## 🏗️ Architecture & Workflow Flowchart

```mermaid
flowchart TD
    A[▶️ Trigger: Manual / Scheduled Execution] --> B[📁 OneDrive: Download Lead List .xlsx]
    B --> C{🔍 If Node: Send Status != 'SENT'?}
    C -- Yes --> D[🔁 Loop Over Pending Leads]
    C -- No --> X[⛔ Skip Contacted Lead]
    
    D --> E[📄 OneDrive: Download Email Templates .xlsx]
    E --> F[🎲 JS Code Node: Random Template Selection & HTML Formatting]
    F --> G[✏️ Edit Fields Node: Replace [name] & [company] Placeholders]
    G --> H[📤 Microsoft Outlook: Send Personalized HTML Email]
    H --> I[💾 Update Local Database & Execution Log]
```

---

## ⚡ Active Workflows

### 1️⃣ Advanced Cold Email Outreach (`Cold Emailing`)
* **Goal**: Full end-to-end automated cold email campaign with dynamic fallback variables.
* **Pipeline Breakdown**:
  1. **Lead Extraction**: Downloads lead `.xlsx` files stored in **Microsoft OneDrive**.
  2. **Strict Verification**: Evaluates `Send Status` to target only unsent leads.
  3. **Template Rotation**: Downloads email variations and picks a random template per lead.
  4. **Dynamic Replacement**: Replaces `[name]` (fallback: *"there"*) and `[company]` (fallback: *"your company"*).
  5. **HTML Dispatch**: Converts text formatting to HTML `<br>` tags and sends via **Microsoft Outlook**.

### 2️⃣ Simple Batch Outreach (`My workflow`)
* **Goal**: Rapid single-template campaign for direct networking and opportunities.
* **Pipeline Breakdown**:
  * Extracts lead contacts $\rightarrow$ Passes variables into a standard JavaScript template $\rightarrow$ Bulk dispatches emails via Outlook.

---

## 📂 Repository Structure

| Path / File | Type | Description |
| :--- | :--- | :--- |
| 📁 [`DockerData/`](file:///d:/Automation/DockerData) | Directory | Houses Docker Desktop WSL data disks and mounted container volumes. |
| 📁 [`DockerData/n8n Data`](file:///d:/Automation/DockerData/n8n%20Data) | Directory | Persistent volume root mounted directly into the n8n Docker container. |
| 🗄️ [`database.sqlite`](file:///d:/Automation/database.sqlite) | File | SQLite database containing workflows, execution history, and user settings. |
| 🔑 [`config`](file:///d:/Automation/config) | File | System config file containing the 256-bit encryption key for saved credentials. |
| 📦 [`nodes/`](file:///d:/Automation/nodes) | Directory | Custom and community-installed n8n node dependencies ([`package.json`](file:///d:/Automation/nodes/package.json)). |
| 📝 [`n8nEventLog.log`](file:///d:/Automation/n8nEventLog.log) | File | Real-time execution and audit logs. |

---

## 🛠️ How to Run & Manage

### Running via Docker Desktop
Ensure Docker Desktop is running on Windows with WSL2 backend enabled, then start the container mounting this directory:

```bash
docker run -d \
  --name n8n-automation \
  -p 5678:5678 \
  -v "D:/Automation/DockerData/n8n Data:/home/node/.n8n" \
  n8nio/n8n:latest
```

Open your browser and visit: **`http://localhost:5678`**

---

> 💡 *Created and configured for automated outreach operations.*
