#Bucket

resource "google_storage_bucket" "website" {
    name = |"ivasyut-bucket"
    location = "US"
}

#make obkects public

resource "google_storage_object_access_control" "public_rule" {
  object = google_storage_bucket_object.static_site_src.name
  bucket = google_storage_bucket.website.name
  role   = "READER"
  entity = "allUsers"
}

resource "google_storage_bucket_object"  "static_site_src" {
    
    name = "index.html"
    source = "../website/index.html"
    bucket = google_storage_bucket.website.name
    
}