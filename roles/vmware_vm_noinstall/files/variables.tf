variable "vsphere_user" {
  description = "vSphere user name"
}
variable "vsphere_password" {
  description = "vSphere password"
}
variable "vsphere_server" {
  description = "vSphere server domain name"
}
variable "vsphere_ssl" {
  description = "vSphere allow unverified ssl "
  default = "true"
}
variable "vsphere_datacenter" {
  description = "vSphere datacenter"
}
variable "vsphere_datastore" {
  description = "vSphere datastore"
}
variable "vsphere_isodatastore" {
  description = "vSphere datastore"
}
variable "vsphere_pool" {
  description = "vSphere resource pool"
}
variable "vsphere_network" {
  description = "vSphere network"
}
variable "vsphere_hostname" {
  description = "vSphere vm hostname"
}
variable "vsphere_cpu" {
  description = "vSphere vm cpu num"
}
variable "vsphere_memory" {
  description = "vSphere vm memory"
}
variable "vsphere_guest_id" {
  description = "vSphere vm guest id"
}
variable "vsphere_disk_label" {
  description = "vSphere vm disk label"
}
variable "vsphere_disk_size" {
  description = "vSphere vm disk size"
}
variable "vsphere_iso" {
  description = "vSphere vm iso"
}
