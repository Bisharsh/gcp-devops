resource "google_container_cluster" "devops-gke"{
    name                        = "devops-gke"
    location                    = "us-central1"
    remove_default_node_pool    = true
    initial_node_count          = 1
    network                     = google_compute_network.gke_vpc.self_link
    subnetwork                  = google_compute_subnetwork.gke_subnet.self_link

    networking_mode             = "VPC_NATIVE"

    node_locations = [
        "us-central1-b"
    ]

    addons_config {
        # http_load_balancing {
        #     disabled = true
        # }

        horizontal_pod_autoscaling {
            disabled = false
        }        
    }

    release_channel {
        channel = "REGULAR"
    }

    workload_identity_config {
        workload_pool = "planar-osprey-446621-b4.svc.id.goog"
    }   

    ip_allocation_policy {
        cluster_secondary_range_name  = "k8s-pods-range"
        services_secondary_range_name = "k8s-service-range"
    } 

    private_cluster_config {
        enable_private_nodes    = true
        enable_private_endpoint = false
        master_ipv4_cidr_block = "172.16.0.0/28"
    }    
}