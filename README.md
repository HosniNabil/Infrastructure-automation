# Infrastructure-automation
 Automating daily infrastructure tasks with Ansible & terraform
## Table of contents
1. [Playbooks](#Playbooks)
2. [Ansible collections](#Ansible collections)

# Playbooks
##**kvm_rhel**
This playbook create a Red Hat enterprise linux VM on KVM host using terraform.
It calls for the **rhel** role in the **kvm_terraform** collection.
###Using the playbook
**ansible-playbook**
```
ansible-playbook -i inventory kvm_rhel.yaml
```
###Variables
- **golang_url** : url to download go from
- **terraform_dir** : terraform working directory
- **terraform_url** : url to download terraform terraform from
- **terraform_libvirt_provider_git** : git project for the libvirt provider
- **vm_volume_name** : terraform vm volume name
- **vm_genericcloud_image_url** : vm generic cloud iso image url
- **vm image name** : vm image name
- **vm_root_password** : root password for the VM
- **vm_user** : default user to create
- **vm_ip** : IP for the default interface
- **vm_gw** : Gateway for the default interface
- **vm_dns** : DNS for the default interface
- **vm_hostname** : hostname
- **vm_memory** : RAM in MB
- **vm_cpu** : number for vpcus
- **vm_network** : network name in the hypervisor
- **vm_authorized_ssh** : authorized public ssh id
#Ansible collections
