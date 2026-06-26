#!/bin/bash

kind create cluster --config kind-config.yaml

helm install cilium cilium/cilium --version 1.19.5 \
  --namespace kube-system \
  --set kubeProxyReplacement=true \
  --set k8sServiceHost=k8s-lab-external-load-balancer \
  --set k8sServicePort=6443

flux bootstrap github \
  --owner=$GITHUB_USER \
  --repository=k8s-lab\
  --branch=main \
  --path=clusters/k8s-lab \
  --personal

