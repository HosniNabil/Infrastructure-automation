# Infrastructure-automation
 Automating daily infrastructure tasks with Ansible & terraform
## Table of contents
1. Playbooks
2. Ansible collections

## Playbooks
1. **kvm_centos8** : Create a VM using the Centos 8 generic cloud image on a kvm host using terraform
2. **kvm_extend_disk** : Extend the VM's root disk by wanted size
3. **kvm_add_disk** : Create and attach a disk to a KVM VM
4. **terraform_cleanup** : Cleanup terraform deployment and delete added disks
## Collections
 - **kvm_terraform**
## kvm_terraform
### Roles
####    1. **centos**
Ansible role to create a VM using the Centos 8 generic cloud image on a kvm host using terraform  
#### Vars
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
