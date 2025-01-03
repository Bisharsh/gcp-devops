terraform {
  required_providers {
    google = 
    {
        source= "hashicorp/google"
        version= "6.14.1"
    }
  }
}

provider "google" {
  project     = "planar-osprey-446621-b4"
  region      = "us-central1"
}

terraform {
    backend "gcs" {
        bucket = "gke_tf_state_backend"
        prefix = "terraform/state"
    }
    
}