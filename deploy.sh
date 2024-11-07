#!/bin/bash

PATH=$PATH:/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

SITE_NAME=benstraw.com
BASE_DIR=/Users/benstraw/dev/benstraw.com
CLOUDFRONT_ID=E1J7PVZ8DBPM0V
START_TIME=$SECONDS

echo "Starting deployment for $SITE_NAME... $(date '+%Y-%m-%d %H:%M:%S')"
cd $BASE_DIR
rm -rf "$BASE_DIR/public"
HUGO_ENV=production /opt/homebrew/bin/hugo --minify --gc
/opt/homebrew/bin/hugo deploy --invalidateCDN
# hugo deploy --maxDeletes -1 --invalidateCDN
# echo "Invalidating CloudFront cache..."
# aws cloudfront create-invalidation --distribution-id $CLOUDFRONT_ID --paths "/*" > /dev/null

ELAPSED_TIME=$(($SECONDS - $START_TIME))
echo "Site $SITE_NAME deployed successfully! Time taken: $(($ELAPSED_TIME / 60)) minutes and $(($ELAPSED_TIME % 60)) seconds."
 
# aws cloudfront get-distribution-config --id E1J7PVZ8DBPM0V > config.json
# aws cloudfront update-distribution --id E1J7PVZ8DBPM0V --distribution-config file://config.json --if-match E3QPPX5R24FKZA
