# Provider
provider "yandex" {
  token     = "${var.yc_token}"
  cloud_id  = "${var.yc_cloud_id}"
  folder_id = "${var.yc_folder_id}"
  zone      = "${var.yc_region}"
}
# VPC network
resource "yandex_vpc_network" "dvps" {
  name = "dvpsnet"
}
# VPC subnet
resource "yandex_vpc_subnet" "subnet" {
  v4_cidr_blocks = ["10.10.10.0/24"]
  zone           = "${var.yc_region}"
  network_id     = "${yandex_vpc_network.dvps.id}"
}
# Resources VM
resource "yandex_compute_instance" "dvps" {
  name = "dvps"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd87tirk5i8vitv9uuo1"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet.id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}

