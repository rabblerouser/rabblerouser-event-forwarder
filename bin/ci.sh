#!/bin/bash

set -e

echo 'INSTALLING DEPENDENCIES'
npm install

echo 'RUNNING TESTS'
npm test

echo 'PACKAGING THE CODE'
zip -r rabblerouser_stream_listener_lambda.zip forwarder/ node_modules/

echo 'UPLOADING TO S3'
aws s3 cp rabblerouser_stream_listener_lambda.zip s3://rabblerouser-artefacts/lambdas/stream_listener/rabblerouser_stream_listener_lambda.zip