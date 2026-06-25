#!/bin/bash
kind create cluster --config kind-config.yaml

flux bootstrap github \
  --owner=$GITHUB_USER \
  --repository=k8s-lab\
  --branch=main \
  --path=clusters/k8s-lab \
  --personal

