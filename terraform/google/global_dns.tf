resource "google_dns_managed_zone" "global-zone" {
  depends_on = [
    "google_compute_global_address.default",
  ]
  name = "global-zone"
  dns_name = "${var.global_domain}."
  description = "Global DNS Zone"
}

resource "google_dns_record_set" "www" {
  name = "www.${google_dns_managed_zone.global-zone.dns_name}"
  managed_zone = "${google_dns_managed_zone.global-zone.name}"
  type = "A"
  ttl  = 300

  rrdatas = ["${google_compute_global_address.default.address}"]
}

resource "google_dns_record_set" "api" {
  name = "api.${google_dns_managed_zone.global-zone.dns_name}"
  managed_zone = "${google_dns_managed_zone.global-zone.name}"
  type = "A"
  ttl  = 300

  rrdatas = ["${google_compute_global_address.default.address}"]
}

resource "google_dns_record_set" "ctrl" {
  name = "ctrl.${google_dns_managed_zone.global-zone.dns_name}"
  managed_zone = "${google_dns_managed_zone.global-zone.name}"
  type = "A"
  ttl  = 300

  rrdatas = ["${google_compute_global_address.default.address}"]
}
