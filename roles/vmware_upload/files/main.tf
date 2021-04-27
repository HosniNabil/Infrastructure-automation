provider "vsphere" {
  user           = var.vsphere_user
  password       = var.vsphere_password
  vsphere_server = var.vsphere_server

  # if you have a self-signed cert
  allow_unverified_ssl = true
}
resource "vsphere_file" "ubuntu_disk_upload" {
  datacenter       = var.vsphere_datacenter
  datastore        = var.vsphere_datastore
  source_file      = var.image_path
  destination_file = var.image_dest
}
