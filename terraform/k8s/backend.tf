terraform {
    backend "gcs" {
        bucket = "tf-state-temporary"
        prefix = "terraform/state"
    }
}
