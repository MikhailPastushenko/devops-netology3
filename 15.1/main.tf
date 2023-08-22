
# 1.VPC-network
resource "yandex_vpc_network" "netology-vpc-network" {
  name = "netology-vpc-network"
}

# 2.1.public subnet
resource "yandex_vpc_subnet" "public" {
  name           = "public"
  zone           = var.YC_ZONE
  network_id     = yandex_vpc_network.netology-vpc-network.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}

# 2.2.NAT-instance
resource "yandex_compute_instance" "nat-instance" {
  name = "nat-instance"
  hostname = "nat-instance"
  zone     = var.YC_ZONE
  resources {
    cores  = 2
    memory = 2
  }
  boot_disk {
    initialize_params {
      image_id = "fd80mrhj8fl2oe87o4e1"
    }
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.public.id
    ip_address = "192.168.10.254"
    nat       = true
  }
  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}

# 2.3.public vm
resource "yandex_compute_instance" "public-vm" {
  name = "public-vm"
  hostname = "public-vm"
  zone     = var.YC_ZONE
  resources {
    cores  = 2
    memory = 2
  }
  boot_disk {
    initialize_params {
      image_id = "fd8bkgba66kkf9eenpkb"
    }
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.public.id
    nat       = true
  }
  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}

# 3.2. route table

resource "yandex_vpc_route_table" "route-table" {
  name       = "route-table"
  network_id = yandex_vpc_network.netology-vpc-network.id
  static_route {
    destination_prefix = "0.0.0.0/0"
    next_hop_address   = "192.168.10.254"
  }
}

# 3.1. private subnet

resource "yandex_vpc_subnet" "private" {
  name           = "private"
  zone           = var.YC_ZONE
  network_id     = yandex_vpc_network.netology-vpc-network.id
  route_table_id = yandex_vpc_route_table.route-table.id
  v4_cidr_blocks = ["192.168.20.0/24"]
}

# 3.3. private vm
resource "yandex_compute_instance" "private-vm" {
  name = "private-vm"
  hostname = "private-vm"
  zone     = var.YC_ZONE
  resources {
    cores  = 2
    memory = 2
  }
  boot_disk {
    initialize_params {
      image_id = "fd8bkgba66kkf9eenpkb"
    }
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.private.id
  }
  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}

# Output
output "zone" {
  value = var.YC_ZONE
}
