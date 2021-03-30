# Infrastructure-automation
 Automating daily infrastructure tasks with Ansible & terraform
## Table of contents
1. [Playbooks](#Playbooks)
2. [Collections](#Collections)

# Playbooks
## **kvm_rhel**
This playbook create a Red Hat enterprise linux VM on KVM host using terraform.
It calls for the **rhel** role in the **kvm_terraform** collection.
### Using the playbook
**ansible-playbook**
```
ansible-playbook -i inventory kvm_rhel.yaml
```
### Variables
- **Virtual machine specs**
  - **vm_hostname** : Virtual machine name
  ```
  vm_hostname: ansible-terraform
  ```
  - **vm_cpu** : vCPUs number
  ```
  vm_cpu: 2
  ```
  - **vm_memory** : RAM in MB
  ```
  vm_memory: 4096
  ```
  - **vm_network** : Virtual machine network name
  ```
  vm_network: vlan42
  ```
  - **rhel_version**: Red hat enterprise linux version to use
  ```
  rhel_version: 8
  ```
  **or**
  ```
  rhel_version: 7
  ```
  - **terraform_dir** : terraform working directory
  ```
  terraform_dir: /home/nabil/lab
  ```
- **Cloud-init config**
  - **vm_user** : default user to create `vm_user`
  - **vm_root_password** : root password for the VM
  - **vm_ip** : IP for the default interface
  - **vm_gw** : Gateway for the default interface
  - **vm_dns** : DNS for the default interface
  - **vm_authorized_ssh** : ssh pubkey to be permitted in default user
# Collections
