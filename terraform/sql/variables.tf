variable "region" {}
variable "project" {}

variable "database_version" {
  default = "MYSQL_5_7"
}

variable "tier" {
  default = "db-f1-micro"
}
