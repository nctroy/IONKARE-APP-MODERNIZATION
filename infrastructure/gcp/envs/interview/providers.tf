variable "project" { type = string, default = "" }
variable "region"  { type = string, default = "us-central1" }

provider "google" {
  project = var.project
  region  = var.region
}


