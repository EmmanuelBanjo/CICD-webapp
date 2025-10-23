# 🚀 Azure Web App CI/CD Pipeline using Terraform & Azure DevOps

This project demonstrates a complete **DevOps workflow** that automates the deployment of a containerized Python Flask web application to **Azure App Service (Linux)** using **Terraform (Infrastructure as Code)** and **Azure DevOps Pipelines (CI/CD)**.

---

## 🧩 Architecture Overview

**Tools & Services Used:**
- **Azure DevOps** → CI/CD pipeline automation  
- **Terraform** → Infrastructure as Code  
- **Azure App Service (Linux)** → Web hosting platform  
- **Docker** → Containerized application runtime  
- **Python Flask** → Simple web application framework  

---

## ⚙️ Deployment Flow

1. **Build Stage**
   - Installs dependencies from `requirements.txt`
   - Runs basic application tests
   - Prepares source code for deployment

2. **Deploy Stage**
   - Uses the Azure CLI and Terraform to:
     - Create a resource group
     - Provision an App Service Plan (Linux)
     - Deploy a containerized Python app to Azure App Service
   - Outputs a live web URL (e.g., `https://devopsdemo-webapp.azurewebsites.net`)

3. **Verification**
   - Visit the live URL to confirm successful deployment:
     ```
     Hello from Azure DevOps Pipeline!
     ```

---

## 🧠 Key Learnings & Challenges

Throughout the development and deployment process, several issues were identified and resolved — each strengthening understanding of CI/CD and Terraform integration.

### 🔹 **1. Service Connection Missing**
- **Error:** “The service connection does not exist or has not been authorized.”
- **Fix:** Created an **Azure Resource Manager Service Connection** in Azure DevOps and updated the pipeline with its correct name.

### 🔹 **2. Terraform Not Found**
- **Error:** `terraform: command not found`
- **Fix:** Installed Terraform dynamically in the pipeline before execution using bash or the TerraformInstaller extension.

### 🔹 **3. Python Runtime Error**
- **Error:** `expected site_config.0.python_version to be one of ["2.7" "3.4"]`
- **Fix:** Switched to **Docker-based App Service deployment** using `linux_fx_version` for Python 3.10 support.

### 🔹 **4. OS Mismatch**
- **Error:** `web.AppsClient#CreateOrUpdate: Failure sending request`
- **Fix:** Configured App Service Plan for **Linux (`kind = "Linux"`, `reserved = true`)** and used Basic B1 SKU.

### 🔹 **5. Duplicate Output**
- **Error:** “Output named ‘app_url’ already defined.”
- **Fix:** Removed duplicate output from `main.tf` and kept only in `outputs.tf`.

### 🔹 **6. Resource Group Exists**
- **Error:** “Resource already exists — must be imported.”
- **Fix:** Changed Resource Group name or imported it into Terraform state.

### 🔹 **7. Slow Deployments**
- **Cause:** Initial Terraform + Azure provisioning on clean DevOps agents.
- **Fix:** Accepted normal latency (6–10 mins). Future optimization: cache Terraform providers or use self-hosted agent.

---

## 📂 Project Structure

```
azure-webapp-cicd/
├── app/
│   ├── app.py
│   ├── requirements.txt
│   └── Dockerfile
├── main.tf
├── variables.tf
├── outputs.tf
├── azure-pipelines.yml
└── README.md
```

---

## 🌍 Expected Output

Once the pipeline completes, visit your web app URL:
```
https://<app_name>.azurewebsites.net
```
Expected page:
> **Hello from Azure DevOps Pipeline!**

---

## 🏁 Outcome

✅ Successfully implemented:
- End-to-end automated deployment using **Azure DevOps Pipelines**
- Cloud infrastructure provisioning with **Terraform**
- Container-based web hosting in **Azure App Service**
- Effective troubleshooting of real DevOps errors and workflows

---

## 👤 Author

**Emmanuel Banjo**  
Cloud & DevOps Engineer  
📧 banjoemmanuel27@gmail.com  
🌍 Kraków, Poland  
