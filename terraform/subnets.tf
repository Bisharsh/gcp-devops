resource "google_compute_subnetwork" "gke_subnet" {
  name                      = "gke_subnet"
  ip_cidr_range             = "10.0.0.0/18"
  region                    = "us-central1"
  network                   = google_compute_network.gke_vpc.id
  private_ip_google_access  = true

  secondary_ip_range {
    range_name    = "k8s-pods-range"
    ip_cidr_range = "10.48.0.0/14"
  }

  secondary_ip_range {
    range_name    = "k8s-services-range"
    ip_cidr_range = "10.52.0.0/20"
  }
}