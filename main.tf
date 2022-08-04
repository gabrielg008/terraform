terraform {
  backend "gcs" {
    bucket = "#Replace with your bucket name"
    prefix = "terraform/state"
  }  
  required_providers {
    google = {
        source = "hashicorp/google"
    }
  }
}

provider "google" {
    version = "3.5.0"
    project = "<PROJECT-ID>"
    region = "us-east-1"
    zone = "us-east1-c"
}

module "instances" {
    source = "./modules/instances"
}

module "storage" {
    source = "./modules/storage"
}

module "VPC" {
  source  = "terraform-google-modules/network/google"
  version = "3.4.0"
  # insert the 3 required variables here
  network_name = "VPC NAME"
  project_id = "<FILL IN WITH THE PROJECT ID"
  routing_mode = "GLOBAL"
  subnets = [
    {
        subnet_name           = "subnet-01"
        subnet_ip             = "10.10.10.0/24"
        subnet_region         = "us-central1"
    },
    {
        subnet_name           = "subnet-02"
        subnet_ip             = "10.10.20.0/24"
        subnet_region         = "us-central1"
        subnet_private_access = "true"
        subnet_flow_logs      = "true"
        description           = "This subnet has a description"
    }   
  ]
}

resource "google_compute_firewall" "tf-firewall" {
  name    = "tf-firewall"
  network = "projects/<FILL IN PROJECT_ID>/global/networks/<FILL IN NETWORK NAME>"

allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]  
  source_tags = ["web"]
}


