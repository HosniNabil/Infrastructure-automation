# Infrastructure-automation
 Automating infrastructure with Ansible & terraform
## Table of contents
1. Example playbooks
2. Ansible collections

## Playbooks
1. centos8_kvm
    - Create a Centos 8 Vm on kvm host using terraform
## Collections
 - **kvm_terraform**
## kvm_terraform
###Roles
####    1. **centos**
Create a VM using the Centos 8 generic cloud image on a kvm host using terraform  
#### Vars
- **golang_url** : url to download go from
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
