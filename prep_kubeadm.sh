#/bin/sh

docker rm $(docker ps -qa --no-trunc --filter "status=exited")
docker rmi $(docker images | awk '/ / { print $3 }')

echo 'Environment="KUBELET_EXTRA_ARGS=--fail-swap-on=false"' > /etc/systemd/system/kubelet.service.d/90-local-extras.conf
systemctl daemon-reload
systemctl restart kubelet

iptables -F
swapoff -a
free -m
kubeadm reset
kubeadm init --pod-network-cidr=10.244.0.0/16 #   --skip-preflight-checks
