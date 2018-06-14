// Google Cloud provider
provider "google" {
  version = "~> 1.5"
}

// Create a new compute engine resource
resource "google_compute_instance" "default" {
  name         = "${var.unique_resource_name}"
  machine_type = "${var.machine_type}"
  zone         = "${var.zone}"
  boot_disk {
    initialize_params {
      image = "${var.boot_disk}"
    }
  }
  network_interface {
    network = "default"

    access_config {  
    }
  }
  metadata {
    sshKeys = "jainakka_0203:${var.public_key}"
  }
  
  provisioner "file" {
    source      = "/tmp/baseline1.sh"
    destination = "/tmp/baseline1.sh"
	connection {
		type = "ssh"
		user = "jainakka_0203"
		private_key = "${file("/tmp/id_rsa")}"
		password = ""
		agent = "false"    
    }
  }
  
  provisioner "remote-exec" {
  inline = [
    "chmod +x /tmp/baseline1.sh",
	  "sudo /tmp/baseline1.sh"
  ]
  connection {
    type = "ssh"
    user = "jainakka_0203"
    private_key = "${file("/tmp/id_rsa")}"
    password = ""
    agent = "false"    
    }
  }
}