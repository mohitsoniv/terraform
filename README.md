# Terraform-S3 Static Website Hosting By Mohit Soni (mohitsoniv)
## Installing Terraform on Ubuntu:24.10
### Step 1: Update Your System
```
sudo apt-get update
```
### Step 2: Install Required Dependencies
```
sudo apt-get install -y gnupg software-properties-common curl
```
### Step 3: Add the HashiCorp GPG Key
```
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
```
### Step 4: Add the HashiCorp APT Repository
```
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
```
### Step 5: Update Your Package List Again
```
sudo apt-get update
```
### Step 6: Install Terraform
```
sudo apt-get install terraform
```
### Step 7: Verify the Installation
```
terraform --version
```
