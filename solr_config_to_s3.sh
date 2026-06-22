#!/bin/bash
export AWS_PROFILE=dspacedirect
export SOLR_VERSION=9.10.1
export DSPACE_VERSION=9.3
export DRYRUN=true

if [ "$DRYRUN" == true ]; then
  DRYRUN_ARG="--dryrun"
else
  DRYRUN_ARG=""
fi

cd dspace/solr/authority/conf
aws s3 cp . s3://dspace-hosting-production-storage/solr/${SOLR_VERSION}/authority-${DSPACE_VERSION}/conf \
  --exclude "*" \
  --include "*.txt" \
  --include "*.xml" \
  $(echo $DRYRUN_ARG)

cd -
cd dspace/solr/oai/conf
aws s3 sync . s3://dspace-hosting-production-storage/solr/${SOLR_VERSION}/oai-${DSPACE_VERSION}/conf \
  --exclude "*" \
  --include "*.txt" \
  --include "*.xml" \
  $(echo $DRYRUN_ARG)

cd -
cd dspace/solr/search/conf
aws s3 sync . s3://dspace-hosting-production-storage/solr/${SOLR_VERSION}/search-${DSPACE_VERSION}/conf \
  --exclude "*" \
  --include "*.txt" \
  --include "*.xml" \
  $(echo $DRYRUN_ARG)

cd -
cd dspace/solr/statistics/conf
aws s3 sync . s3://dspace-hosting-production-storage/solr/${SOLR_VERSION}/statistics-${DSPACE_VERSION}/conf \
  --exclude "*" \
  --include "*.txt" \
  --include "*.xml" \
  $(echo $DRYRUN_ARG)

cd -
cd dspace/solr/qaevent/conf
aws s3 sync . s3://dspace-hosting-production-storage/solr/${SOLR_VERSION}/qaevent-${DSPACE_VERSION}/conf \
  --exclude "*" \
  --include "*.txt" \
  --include "*.xml" \
  $(echo $DRYRUN_ARG)

cd -
cd dspace/solr/suggestion/conf
aws s3 sync . s3://dspace-hosting-production-storage/solr/${SOLR_VERSION}/suggestion-${DSPACE_VERSION}/conf \
  --exclude "*" \
  --include "*.txt" \
  --include "*.xml" \
  $(echo $DRYRUN_ARG)