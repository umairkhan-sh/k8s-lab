#!/bin/bash

kind create cluster --config kind-config.yaml

cilium-cli install --version v1.19.3

flux bootstrap github \
  --owner=$GITHUB_USER \
  --repository=k8s-lab\
  --branch=main \
  --path=clusters/k8s-lab \
  --personal

