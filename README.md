# Modular Azure Infrastructure for VM (Terraform)

This project demonstrates the deployment of infrastructure for a ToDo List web application on an Azure Virtual Machine using **Terraform**. The main focus is on building a clean, **modular Infrastructure as Code (IaC) architecture**, configuring a **remote Terraform state backend**, and automating application bootstrapping using the `CustomScript` extension.

## 🎯 Project Goal

This repository serves as a demonstration of professional DevOps practices for managing Azure infrastructure, specifically highlighting:

* **Modularity:** separating infrastructure into logical, reusable modules (`network`, `compute`, `storage`).
* **Remote State Management:** configuring Azure Blob Storage as a secure, centralized backend for `terraform.tfstate`, which is critical for team collaboration and state locking.
* **VM Automation:** utilizing the `azurerm_virtual_machine_extension` to automatically trigger the `install-app.sh` script upon VM creation, which provisions the server and starts the application.
* **Parameterization:** full control over infrastructure via variables (`.tfvars`) allowing for easy environment or region switching.

## ⚙️ Technologies Used

* **Terraform (IaC)**
* **Azure Cloud Services:**
    * Virtual Machine (Ubuntu 22.04)
    * Virtual Network (VNet)
    * Network Security Group (NSG)
    * Public IP
    * Storage Account & Blob Storage
* **Bash** (for `install-app.sh` automation)

## 🏗️ Infrastructure Architecture

The project uses a root module (`main.tf`) that calls three specialized child modules to ensure a clear separation of concerns.

### 1. Network Module (`modules/network`)

Responsible for all networking resources:
* **Virtual Network (`vnet`):** An isolated network for resources (`10.0.0.0/16`).
* **Subnet (`default`):** The subnet where the VM resides (`10.0.0.0/24`).
* **Network Security Group (`defaultnsg`):** Manages inbound/outbound traffic rules (e.g., allowing HTTP on port 80 and SSH on port 22).
* **Public IP Address (`linuxboxpip`):** A dynamic or static IP with a unique DNS label for external access.

### 2. Compute Module (`modules/compute`)

Responsible for compute resources:
* **Network Interface (`nic`):** Connects the VM to the VNet.
* **Virtual Machine (`matebox`):** A `Standard_B1s` Ubuntu 22.04 VM acting as the application host.
* **VM Extension (`CustomScript`):** Automatically downloads and executes `install-app.sh` to configure the server and launch the ToDo List app.

### 3. Storage Module (`modules/storage`)

Responsible for artifact storage:
* **Storage Account:** Creates the storage account resource.
* **Storage Container (`task-artifacts`):** A container for storing application builds or logs.

### 4. Remote State Backend (`backend.tf`)

The Terraform configuration is set up to store the state file (`terraform.tfstate`) in **Azure Blob Storage**. This prevents state conflicts, data loss, and enables secure team collaboration.

## 🗂️ File Structure

```text
/
├─ modules/
│  ├─ network/
│  │  ├─ main.tf
│  │  ├─ variables.tf
│  │  └─ outputs.tf
│  ├─ compute/
│  │  ├─ main.tf
│  │  ├─ variables.tf
│  │  └─ outputs.tf
│  └─ storage/
│     ├─ main.tf
│     ├─ variables.tf
│     └─ outputs.tf
├─ main.tf               # Root configuration calling modules
├─ variables.tf          # Variable declarations (location, vm_name...)
├─ outputs.tf            # Output values (e.g., Public IP)
├─ terraform.tfvars      # Variable values (gitignored)
└─ backend.tf            # Remote state configuration
```

### 🚀 How to Deploy
1. Prerequisites
* Azure CLI installed and logged in.
* Terraform installed.
* A public SSH key (usually located at `~/.ssh/id_rsa.pub`).
2. Configure Azure Backend
Terraform requires a location to store its state file. This step must be done manually ONCE.
```
# 1. Login to Azure
az login

# 2. Create a Resource Group for the state file
az group create --name mate-azure-task-12 --location uksouth

# 3. Create a Storage Account (replace 'yourstorageaccount' with a UNIQUE name)
az storage account create --name yourstorageaccount --resource-group mate-azure-task-12 --location uksouth --sku Standard_LRS

# 4. Create the Blob Container
az storage container create --name tfstate --account-name yourstorageaccount
```
(Note: Ensure the names in backend.tf match the resources you just created).

3. Clone and Configure
```
# Clone the repository
git clone https://github.com/Muskam09/terraform-python-app.git
cd terraform-python-app

# Create a terraform.tfvars file for your secrets
# (Terraform automatically picks up this file)
echo 'ssh_key_public = "'$(cat ~/.ssh/id_rsa.pub)'"' > terraform.tfvars
```
 4. Initialize and Apply
```
# Initialize Terraform
# (Downloads modules and connects to the remote backend)
terraform init

# Review planned changes
terraform plan

# Apply the configuration and create infrastructure
terraform apply
```
Type `yes` when prompted to confirm.

5. Verify Deployment
After a successful apply, Terraform will display the defined outputs.
```
# You can retrieve the VM IP address at any time:
terraform output public_ip_address

# Open this IP in your browser
# http://[YOUR_PUBLIC_IP]
```
You should see the running ToDo List application.

### ⏹️ Cleanup
To remove all created resources and avoid costs:
```terraform destroy```
(Note: Don't forget to also manually delete the `mate-azure-task-12` Resource Group created for the state file if you no longer need it).
