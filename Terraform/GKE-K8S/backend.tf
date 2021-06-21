terraform {
  backend "gcs" {
    bucket  = "terra-pahlawan"
    prefix  = "terraform/state"
 }
}
