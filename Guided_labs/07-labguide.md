# Using Ansible Galaxy to Find and Use Community Roles in Your Playbooks

## Table of Contents

1. [Introduction](#introduction)
2. [Problem Statement](#problem-statement)
3. [Prerequisites](#prerequisites)
   - [Software Requirements](#software-requirements)
4. [Step-by-Step Guide to Using Ansible Galaxy](#step-by-step-guide-to-using-ansible-galaxy)
   - [Step 1: Installing a Role from Ansible Galaxy](#step-1-installing-a-role-from-ansible-galaxy)
   - [Step 2: Using the Installed Role in a Playbook](#step-2-using-the-installed-role-in-a-playbook)
   - [Step 3: Execute Playbook](#step-3-execute-playbook)
5. [Verifying the Deployment](#verifying-the-deployment)
6. [Supported References](#supported-references)

---

## Introduction

Ansible Galaxy is a platform that hosts thousands of community-contributed roles and collections. These roles simplify the process of writing playbooks for common tasks like server setup, configuration management, and application deployment.

> **Note: What is Ansible Galaxy?**
>
>       Ansible Galaxy is a public repository of Ansible roles and collections contributed by the Ansible community. It provides a platform where users can share their roles, and others can easily download and use them in their playbooks. Galaxy roles are reusable and follow best practices for writing efficient, modular Ansible code.

In this guide, we’ll explore how to find and use Ansible Galaxy roles to automate the installation of Chocolatey, a popular package manager for Windows.

---

## Problem Statement

Writing Ansible roles for every task from scratch can be repetitive and time-consuming. Ansible Galaxy provides pre-built roles created by the community to address various use cases. By leveraging these roles, you can streamline your automation tasks and reuse well-maintained code.

---

## Prerequisites
Completion of all previous lab guides (up to Lab Guide-06) is required before proceeding with Lab Guide-07.

### Software Requirements
- **Ansible 2.9+**: Installed on your control node (WSL for Windows users).
- **WSL (Windows Subsystem for Linux)**: If using Windows as your control node.
- **Access to Ansible Galaxy**: Internet connection to download roles.

---

## Step-by-Step Guide to Using Ansible Galaxy

### Step 1: Installing a Role from Ansible Galaxy

1. **Search for a Role on Galaxy**:
   - Navigate to the Ansible Galaxy website [here](https://galaxy.ansible.com/) and search for a role that fits your needs. For example, search for a Chocolatey role by typing "chocolatey" in the search bar.

2. **Install the Role**:
   - Once you find the role you need, you can install it using the `ansible-galaxy` command. For example, to install the Chocolatey role, run:

   ```bash
   ansible-galaxy role install oatakan.chocolatey_package_localize
   ```

   ![image](../Ansible/images/ansible-43.png)

   This will install the role in the default roles directory (`~/.ansible/roles`).

3. **Verify Installation**:
   - To verify that the role has been installed, you can list all installed roles:

   ```bash
   ansible-galaxy list
   ```

   ![image](../Ansible/images/ansible-44.png)

   You should see the newly installed role (`oatakan.chocolatey_package_localize`) in the list.

---

### Step 2: Using the Installed Role in a Playbook

Now that the role is installed, you can use it in your playbooks.

1. **Create a new playbook**:

   ```bash
   nano install_chocolatey.yml
   ```

2. **Add the following content to the file**:

   ```yaml
   ---
   - name: Install Chocolatey using Ansible Galaxy Role
     hosts: windows
     tasks:
       - name: Install Chocolatey
         include_role:
           name: oatakan.chocolatey_package_localize
   ```

   ![image](../Ansible/images/ansible-45.png)

   This playbook will use the Chocolatey role to install the Chocolatey package manager on the target Windows machine.

---

### Step 3: Execute Playbook

Once the playbook is ready, you can run it using the `ansible-playbook` command.

```bash
ansible-playbook install_chocolatey.yml
```

![image](../Ansible/images/ansible-46.png)

---

## Verifying the Deployment

Once the playbook has been executed, you can verify that Chocolatey is installed by opening a PowerShell prompt on the target Windows machine and running:

```powershell
choco --version
```

![image](../Ansible/images/ansible-47.png)

You should see the version number of Chocolatey if the installation was successful.

---

## Supported References

- [Ansible Galaxy Documentation](https://docs.ansible.com/ansible/latest/galaxy/user_guide.html)
- [Ansible Galaxy](https://galaxy.ansible.com/)
- [Ansible Galaxy Chocolatey](https://galaxy.ansible.com/ui/standalone/roles/oatakan/chocolatey_package_localize/install/)

---