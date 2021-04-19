provider "vsphere" {
  user           = var.vsphere_user
  password       = var.vsphere_password
  vsphere_server = var.vsphere_server

  # If you have a self-signed cert
  allow_unverified_ssl = true
}
resource "vsphere_file" "image_upload" {
  datacenter       = var.vsphere_dc
  datastore        = var.vsphere_datastore
  source_file      = "{{ image_path }}"
  destination_file = "iso/{{ image_name }}.iso"
}
