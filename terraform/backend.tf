terraform {
    backend "gcs" {
        bucket = "tf-state-temporary"
        prefix = "terraform/state"
        credentials = "~/key.json"
    }
}
