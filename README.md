# Infrastructure-automation
 Automating daily infrastructure tasks with Ansible & terraform
## Table of contents
1. [Playbooks](#Playbooks)
2. [Collections](#Collections)

# Playbooks
Example playbooks to use collection roles
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
  - **vm_user** : default user to create `vm_user: nabil`
  - **vm_root_password** : root password for the VM `vm_root_password: P@ssw0rd`
  - **vm_ip** : IP/prefix for the default interface `vm_ip: 10.0.42.10/24`
  - **vm_gw** : Gateway for the default interface `vm_gw: 10.0.42.254`
  - **vm_dns** : DNS for the default interface `vm_dns: 8.8.8.8`
  - **vm_authorized_ssh** : ssh pubkey to be permitted in default user `vm_authorized_ssh: ssh-rsa AAAAB.....`
## **kvm_centos8**
This playbook create a Centos VM on KVM host using terraform.
  It calls for the **centos** role in the **kvm_terraform** collection.
  The default Centos version is 8, but other images url can be specified.
### Using the playbook
  **ansible-playbook**
  ```
  ansible-playbook -i inventory kvm_centos8.yaml
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
    - **vm_genericcloud_image_url**: Generic cloud source image url to use
    ```
    vm_genericcloud_image_url: https://cloud.centos.org/centos/8/x86_64/images/CentOS-8-GenericCloud-8.1.1911-20200113.3.x86_64.qcow2
    ```
    - **terraform_dir** : terraform working directory
    ```
    terraform_dir: /home/nabil/lab
    ```
  - **Cloud-init config**
    - **vm_user** : default user to create `vm_user: nabil`
    - **vm_root_password** : root password for the VM `vm_root_password: P@ssw0rd`
    - **vm_ip** : IP/prefix for the default interface `vm_ip: 10.0.42.10/24`
    - **vm_gw** : Gateway for the default interface `vm_gw: 10.0.42.254`
    - **vm_dns** : DNS for the default interface `vm_dns: 8.8.8.8`
    - **vm_authorized_ssh** : ssh pubkey to be permitted in default user  `vm_authorized_ssh: ssh-rsa AAAAB.....`

## **terraform_cleanup**
This playbook will destory a terraform deployment
### Using the playbook
**ansible-playbook**
```
ansible-playbook -i inventory terraform_cleanup.yaml
```
### Variables
- **terraform_dir**: terraform directory for the deployment to destory   `terraform_dir: /home/nabil/terraform`
## **kvm_extend_disk**
This playbook will extend the root disk of a specified KVM machine
### Using the playbook
**ansible-playbook**
```
ansible-playbook -i inventory kvm_extend_disk.yaml
```
### Variables
- **vm_hostname**: name of the vm to extend its root disk `vm_hostname: ansible-terraform`
- **size**: size of the extention `size: 10G`
- **pool_path**: VM's storage pool path `pool_path: /var/lib/libvirt/images`
## **post-install-rhel**
This playbook will subscribe the system to Red Hat subscription management, configure ssh server with no root access , plus no password access, update the system and setup a vnc server
### Using the playbook
**ansible-playbook**
```
ansible-playbook -i inventory post-install-rhel.yaml
```
### Variables
- **rhsm_user**: Red Hat subscription username `rhsm_user: user@mail`
- **rhsm_pw**: Red Hat subscription password `rhsm_pw: password`
- **rhsm_pool**: Red Hat subscription pool ID `rhsm_id: xxxxxxxxxx`
- **user**: User for the vnc server `user: nabil`
- **password**: vnc server password `password: P@ssw0rd`
## **post-install**
This playbook is the same as the post-install-rhel for non subscription systems (Such as Centos)
## **nfs-server**
This playbook will deploy an NFS server to the remote system.
### Using the playbook
**ansible-playbook**
```
ansible-playbook -i inventory nfs-server.yaml
```
### Variables
- **shared_dir**: shared directory to be exposed `shared_dir: /nfsshare`
- **permissions**: permissions provided to the shared directory `permissions: 0775`
# Collections
## [kvm_terraform](collections/ansible_collections/hosninabil/kvm_terraform/README.md)
## [linux_server](collections/ansible_collections/hosninabil/linux_server/README.md)
