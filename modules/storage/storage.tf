resource "google_storage_bucket" "storage-bucket" {
  name = "<FILL IN BUCKET NAME>"
  location = "US"
  force_destroy = true
  uniform_bucket_level_access = true
}