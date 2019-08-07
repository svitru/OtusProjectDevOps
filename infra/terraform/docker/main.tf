terraform {
  # Версия terraform
  required_version = ">0.11"
}

provider "google" {
  # Версия провайдера
  version = "2.0.0"

  # ID проекта
  project = "${var.project}"

  region = "${var.region}"
}

resource "google_compute_instance" "instance" {
  name         = "instance-${count.index}"
  machine_type = "g1-small"
  zone         = "${var.zone}"
  count        = "${var.count}"
  tags         = ["searcher-app"]

  boot_disk {
    initialize_params {
      image = "${var.disk_image}"
    }
  }

  network_interface {
    network = "default"

    access_config = {}
  }
  
  metadata {
    ssh-keys = "appuser:${file(var.public_key_path)}"
  }

  connection {
    type  = "ssh"
    user  = "appuser"
    agent = false

    # путь до приватного ключа
    private_key = "${file(var.private_key_path)}"
  }

  provisioner "remote-exec" {
    inline = ["curl -fsSL https://get.docker.com -o get-docker.sh", "sudo sh get-docker.sh", "sudo usermod -aG docker $USER"]
  }

  provisioner "remote-exec" {
    inline = ["sudo curl -L https://github.com/docker/compose/releases/download/1.24.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose", "sudo chmod +x /usr/local/bin/docker-compose"]
  }

}

