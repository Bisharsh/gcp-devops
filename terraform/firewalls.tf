resource "google_compute_firewall" "allow-ssh" {
    name = "allow-ssh"
    network = google_compute_network.gke_vpc.name

    allow {
        protocol = "tcp"
        port = ["22"]
    }

    source_ranges = ["0.0.0.0/0"]
}