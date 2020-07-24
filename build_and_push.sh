#!/bin/bash
docker build -t grafana .
docker tag grafana:latest us.gcr.io/wellpadworx-dev/grafana:testing
gcloud docker -- push us.gcr.io/wellpadworx-dev/grafana:testing
echo ------------------- DONE! -------------------
