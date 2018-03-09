#/bin/sh

iptables -F
swapoff -a
free -m
kubeadm reset
kubeadm init --kubernetes-version v1.8.0 --pod-network-cidr=10.244.0.0/16
