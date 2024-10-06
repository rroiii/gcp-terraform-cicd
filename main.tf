resource "google_storage_bucket" "terraform_bucket" {
  name                     = "terraform-bucket"
  project                  = "high-sunlight-437501-f6"
  location                 = "US"
  force_destroy            = true
  public_access_prevention = "enforced"
}