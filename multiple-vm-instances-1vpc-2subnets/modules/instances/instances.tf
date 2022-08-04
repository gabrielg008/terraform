resource "google_compute_instance" "tf-instance-1" {
  name         = "tf-instance-1"
  machine_type = "n1-standard-1"
 
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    network = "vpc"
    subnetwork = "subnet-01"
  }

  metadata_startup_script = <<-EOT
#!/bin/bash
EOT

allow_stopping_for_update = "true"
}

resource "google_compute_instance" "tf-instance-2" {
  name         = "tf-instance-2"
  machine_type = "n1-standard-1"
 
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    network = "vpc"
    subnetwork = "subnet-02"
  }

  metadata_startup_script = <<-EOT
#!/bin/bash
EOT

allow_stopping_for_update = "true"
}

resource "google_compute_firewall" "tf-firewall" {
  name    = "tf-firewall"
  network = "vpc"
  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
  source_tags = ["web"]
  source_ranges = ["0.0.0.0/0"]
}

