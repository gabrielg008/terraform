resource "google_compute_instance" "tf-instance-1" {
  name = "tf-instance-1"
  machine_type = "n1-standard-1"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    network = "default"
  }

  metadata_startup_script = <<-EOT
        #!/bin/bash
    EOT

  allow_stopping_for_update = true
}

resource "google_compute_instance" "tf-instance-2" {
    name = "tf-instance-2"
    machine_type = "n1-standard-1"

    boot_disk {
      initialize_params {
        image = "debain-cloud/debian-10"
      }
    }

    network_interface {
      network = "deafult"
    }

    metadata_startup_script = <<-EOT
        #!/bin/bash
    EOT

  allow_stopping_for_update = true
}


//terraform import module.instances.google_compute_instance.tf-instance-1 <FILL IN INSTANCE 1 ID>
//terraform import module.instances.google_compute_instance.tf-instance-2 <FILL IN INSTANCE 2 ID>
//terraform plan
//terraform apply


//Se modifican los recursos y se crea uno nuevo
resource "google_compute_instance" "tf-instance-1" {
  name         = "tf-instance-1"
  machine_type = "n1-standard-2"
  zone         = "us-central1-a"
  allow_stopping_for_update = true

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
 network = "default"
  }
}

resource "google_compute_instance" "tf-instance-2" {
  name         = "tf-instance-2"
  machine_type = "n1-standard-2"
  zone         = "us-central1-a"
  allow_stopping_for_update = true

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
 network = "default"
  }
}

resource "google_compute_instance" "<FILL IN INSTANCE 3 NAME>" {
  name         = "<FILL IN INSTANCE 3 NAME>"
  machine_type = "n1-standard-2"
  zone         = "us-central1-a"
  allow_stopping_for_update = true

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
 network = "default"
  }
}


//terraform taint module.instances.google_compute_instance.<FILL IN INSTANCE 3 NAME>


resource "google_compute_instance" "tf-instance-1" {
  name         = "tf-instance-1"
  machine_type = "n1-standard-2"
  zone         = "us-central1-a"
  allow_stopping_for_update = true

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
 network = "<FILL IN NETWORK NAME>"
    subnetwork = "subnet-01"
  }
}

resource "google_compute_instance" "tf-instance-2" {
  name         = "tf-instance-2"
  machine_type = "n1-standard-2"
  zone         = "us-central1-a"
  allow_stopping_for_update = true

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
 network = "<FILL IN NETWORK NAME>"
    subnetwork = "subnet-02"
  }
}