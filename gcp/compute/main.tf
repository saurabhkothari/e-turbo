

resource "google_compute_instance" "vm_instance" {
  count        = var.instance_count
  #name         = "${var.instance_name_prefix}-${count.index}"
  #machine_type = var.instance_machine_types[var.instance_name_prefix]
  name         = "selfservice-vm-${count.index}"
  machine_type = var.instance_name == "selfservice-vm-${count.index}" ? var.new_machine_type : var.default_machine_type
  boot_disk {
    initialize_params {
      image = "turbo-se-lab-cpu-stress"
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network = "default"
    access_config {
    }
  }
  allow_stopping_for_update = true  # Allow stopping for updates
  tags = ["Owner-Saurabh Kothari"]

}

output "instance_id" {
  value = google_compute_instance.vm_instance.*.instance_id
}

output "instance_name" {
   value = google_compute_instance.vm_instance.*.name
}
