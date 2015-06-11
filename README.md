# Mongo S3 Backup

This container runs a cron job which:

- dumps a mongo database using `mongodump`
- archives the dump and uploads it to Amazon S3

You can configure the execution of the above steps by setting the following
environment variables:

* **MONGO_HOST**
* **MONGO_PORT**
* **AWS_ACCESS_KEY_ID**
* **AWS_SECRET_ACCESS_KEY**
* **S3_BUCKET**
* **S3_FOLDER**
* **BACKUP_FILENAME_PREFIX** (optional)
* **BACKUP_FILENAME_DATE_FORMAT** (optional)
* **CRON_SCHEDULE** (optional)
