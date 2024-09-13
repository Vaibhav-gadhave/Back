## Step-by-Step Installation

URL:  https://nvtienanh.info/blog/cai-dat-kubernetes-cluster-tren-ubuntu-server-22-04

### Step 1: Disable Swap on All Nodes

sudo swapoff -a
sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab

### Step 2: Enable IPv4 Packet Forwarding

sudo tee /etc/modules-load.d/containerd.conf <<EOF
overlay
br_netfilter
EOF

sudo modprobe overlay
sudo modprobe br_netfilter

sudo tee /etc/sysctl.d/kubernetes.conf <<EOF
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
net.ipv4.ip_forward = 1
EOF

sudo sysctl --system

### Step 3: Install containerd

# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update && sudo apt-get install containerd.io && sudo systemctl enable --now containerd


### Step 4: Modify containerd Configuration for systemd Support
sudo containerd config default | sudo tee /etc/containerd/config.toml >/dev/null 2>&1
sudo sed -i 's/SystemdCgroup \= false/SystemdCgroup \= true/g' /etc/containerd/config.toml

### Step 5: Restart containerd and Check the Status

sudo systemctl restart containerd && sudo systemctl enable containerd && systemctl status containerd

### Step 6: Install kubeadm, kubelet, and kubectl

sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl gpg

sudo mkdir -p -m 755 /etc/apt/keyrings
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.30/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.30/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list

sudo apt-get update -y
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl


### Step 7: Initialize the Cluster

sudo kubeadm config images pull
sudo kubeadm init --pod-network-cidr 10.10.0.0/16 --control-plane-endpoint "192.168.57.101:6443" --upload-certs --v=5

#### After Initialzing the Cluster Connect to it and apply the CNI yaml (We're using Weave CNI in this guide)

#To start using your cluster, you need to run the following as a regular user:

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config


### Step 8: Join Worker Nodes to the Cluster
#### Run the command generated after initializing the master node on each worker node. For example:

kubeadm join 192.168.57.101:6443 --token zcijug.ye3vrct74itrkesp \
        --discovery-token-ca-cert-hash sha256:e9dd1a0638a5a1aa1850c16f4c9eeaa2e58d03f97fd0403f587c69502570c9cd

### Step 9: Let's run the command to check the cluster status.

kubectl cluster-info
kubectl get nodes

### Step 10: Install Calico Pod Network for Kubernetes cluster

curl https://raw.githubusercontent.com/projectcalico/calico/v3.25.0/manifests/calico.yaml -O

### Step 11: Edit the line into this

---
# The default IPv4 pool to create on startup if none exists. Pod IPs will be
# chosen from this range. Changing this value after installation will have
# no effect. This should fall within `--cluster-cidr`.
- name: CALICO_IPV4POOL_CIDR
  value: '10.10.0.0/16'
# Disable file logging so `kubectl logs` works.
- name: CALICO_DISABLE_FILE_LOGGING
  value: 'true'

### Step 12: Then we install Calico on Kubernetes cluster:

  kubectl apply -f calico.yaml

### Step 13: Now check everything is working fine or not

kubectl get pods -n kube-system
kubectl get nodes
