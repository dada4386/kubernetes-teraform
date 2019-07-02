resource "random_id" "rand" {
  byte_length = 6
}

resource "google_sql_database_instance" "master" {
  name              = "master-${var.project}-${random_id.rand.hex}"
  database_version  = "${var.database_version}"
  region            = "${var.region}"
  project           = "${var.project}"

  settings {
    tier    = "${var.tier}"

    backup_configuration {
      binary_log_enabled    = "true"
      enabled               = "true"
      start_time            = "12:00"
    }
  }
}

resource "google_sql_database_instance" "replica" {
  depends_on = [
    "google_sql_database_instance.master",
    "google_sql_database.database",
    "google_sql_user.users",
  ]
  name                  = "replica-${var.project}-${random_id.rand.hex}"
  database_version      = "${var.database_version}"
  region                = "${var.region}"
  project               = "${var.project}"

  master_instance_name  = "${google_sql_database_instance.master.name}"
  replica_configuration {
    failover_target     = "true"
  }

  settings {
    tier    = "${var.tier}"
  }
}

resource "google_sql_database" "database" {
  depends_on = [
    "google_sql_database_instance.master"
  ]
  name      = "api-database"
  project   = "${var.project}"
  instance  = "${google_sql_database_instance.master.name}"
  charset   = "utf8"
  collation = "utf8_general_ci"
}

resource "google_sql_user" "users" {
  depends_on = [
    "google_sql_database_instance.master"
  ]
  name     = "root"
  project   = "${var.project}"
  instance = "${google_sql_database_instance.master.name}"
  host     = "%"
  password = "password"
}
