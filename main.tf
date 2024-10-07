resource "google_storage_bucket" "terraform_bucket" {
  name                     = "skripsi-test-bucket"
  project                  = "high-sunlight-437501-f6"
  location                 = "US"
  force_destroy            = true
}