provider "vsphere" {
  user           = var.vsphere_user
  password       = var.vsphere_password
  vsphere_server = var.vsphere_server

  # if you have a self-signed cert
  allow_unverified_ssl = var.vsphere_ssl
}
data "vsphere_datacenter" "dc" {
  name = var.vsphere_datacenter
}

data "vsphere_datastore" "datastore" {
  name          = var.vsphere_datastore
  datacenter_id = data.vsphere_datacenter.dc.id
}
data "vsphere_datastore" "isodatastore" {
  name          = var.vsphere_isodatastore
  datacenter_id = data.vsphere_datacenter.dc.id
}


data "vsphere_resource_pool" "pool" {
  name          = var.vsphere_pool
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  name          = var.vsphere_network
  datacenter_id = data.vsphere_datacenter.dc.id
}

resource "vsphere_virtual_machine" "vm" {
  name             = var.vsphere_hostname
  datastore_id     = data.vsphere_datastore.datastore.id
  resource_pool_id = data.vsphere_resource_pool.pool.id
  num_cpus = var.vsphere_cpu
  memory   = var.vsphere_memory
  guest_id = var.vsphere_guest_id

  network_interface {
    network_id = data.vsphere_network.network.id
  }
  wait_for_guest_net_timeout = 0

  disk {
    label = var.vsphere_disk_label
    size  = var.vsphere_disk_size
  }
  cdrom {
    datastore_id = data.vsphere_datastore.isodatastore.id
    path         = var.vsphere_iso
  }
}
