resource "google_compute_router" "router" {
  name    = "gke-router"
  network = google_compute_network.gke_vpc.id
  region  = "us-central1"
}