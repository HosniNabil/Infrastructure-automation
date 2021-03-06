#libvirt provider
provider "libvirt" {
  uri = "qemu:///system"
}
#VM volume
resource "libvirt_volume" "vm-qcow2" {
  name = var.vm_volume
  pool = "default"
  source = var.image_path
  format = "qcow2"
}

data "template_file" "user_data" {
  template = file("${path.module}/config/cloud_init.yaml")
}
data "template_file" "network_config" {
  template = file("${path.module}/config/network-config")
}

resource "libvirt_cloudinit_disk" "commoninit" {
  name           = "commoninit.iso"
  user_data      = data.template_file.user_data.rendered
  network_config = data.template_file.network_config.rendered
  pool           = "default"
}


# Define KVM domain to create
resource "libvirt_domain" "domain-terraform" {
  name   = var.vm_hostname
  memory = var.vm_memory
  vcpu   = var.vm_cpu

  cloudinit = libvirt_cloudinit_disk.commoninit.id

  network_interface {
    network_name   = var.vm_network
#    wait_for_lease = true
    hostname       = var.vm_hostname
  }

  console {
    type        = "pty"
    target_port = "0"
    target_type = "serial"
  }

  console {
    type        = "pty"
    target_type = "virtio"
    target_port = "1"
  }

  disk {
    volume_id = libvirt_volume.vm-qcow2.id
  }

  graphics {
    type        = "spice"
    listen_type = "address"
    autoport    = true
  }


}
