resource "google_project_service" "compute" {
    service = "compute.googleapis.com"
}

resource "google_project_service" "container" {
    servie = "container.googleapis.com"
}

resource "google_compute_network" "gke-vpc" {
    # project = GCP-DevOps-Project
    name                            = "gke-vpc"
    mtu                             = 1460
    routing_mode                    = "REGIONAL"
    auto_create_subnetworks         = "false"
    delete_default_routes_on_create = "false"

    depends_on = [
        google_project_service.compute,
        google_project_service.container
    ]
}