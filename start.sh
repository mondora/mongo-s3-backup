#!/bin/bash
: ${AWS_ACCESS_KEY_ID:?"env variable is required"}
: ${AWS_SECRET_ACCESS_KEY:?"env variable is required"}
: ${MONGO_HOST:?"env variable is required"}
: ${MONGO_PORT:?"env variable is required"}
: ${S3_BUCKET:?"env variable is required"}
: ${S3_FOLDER:?"env variable is required"}
export AWS_DEFAULT_REGION=$(python get_bucket_region.py $S3_BUCKET)
export BACKUP_FILENAME_DATE_FORMAT=${BACKUP_FILENAME_DATE_FORMAT:-%Y%m%d}
export BACKUP_FILENAME_PREFIX=${BACKUP_FILENAME_PREFIX:-mongo_backup}
export CRON_SCHEDULE=${CRON_SCHEDULE:-0 1 * * *}

echo
echo "Configuration"
echo
echo "MONGO_HOST:                     $MONGO_HOST"
echo "MONGO_PORT:                     $MONGO_PORT"
echo "AWS_ACCESS_KEY_ID:              $AWS_ACCESS_KEY_ID"
echo "AWS_SECRET_ACCESS_KEY:          $AWS_SECRET_ACCESS_KEY"
echo "S3_BUCKET:                      $S3_BUCKET"
echo "S3_FOLDER:                      $S3_FOLDER"
echo "AWS_DEFAULT_REGION:             $AWS_DEFAULT_REGION"
echo "BACKUP_FILENAME_DATE_FORMAT:    $BACKUP_FILENAME_DATE_FORMAT"
echo "BACKUP_FILENAME_PREFIX:         $BACKUP_FILENAME_PREFIX"
echo "CRON_SCHEDULE:                  $CRON_SCHEDULE"
echo

echo "$CRON_SCHEDULE /script/backup.sh" | crontab -
exec cron -f
