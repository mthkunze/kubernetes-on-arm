#/bin/sh

iptables -F
swapoff -a
free -m
kubeadm reset
kubeadm init --pod-network-cidr=10.244.0.0/16
