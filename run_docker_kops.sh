#!/bin/bash

docker build -t spaul5/kops .
docker run --rm -it \
  -e AWS_REGION \
  -e AWS_PROFILE \
  -e KOPS_STATE_STORE \
  -v "$HOME"/.ssh:/root/.ssh:ro \
  -v "$HOME"/.aws:/root/.aws:ro \
  -v "$HOME"/.kube:/root/.kube:rw \
  -v "$(pwd)":/workdir \
  -w /workdir \
  spaul5/kops "$@"
