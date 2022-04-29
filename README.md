# geoipupdate-s3

Docker image based on https://github.com/maxmind/geoipupdate that performs automatic updates of GeoIP databases and uploads them to a S3 bucket.

# Usage

The functionality is similar to the one described in
[geoipupdate Docker image documentation](https://github.com/maxmind/geoipupdate/blob/7a30cc941ec489848a7c6520f8ef93165dd90e89/doc/docker.md)
with the exception that the environment variable `GEOIPUPDATE_DB_DIR` is not accepted. Instead, `S3_URI` is necessary
to specify where the databases should be uploaded to.
