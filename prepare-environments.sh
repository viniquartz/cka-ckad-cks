# !/bin/bash
# Vinicius Santiago
# prepare-environments

#install docker
echo "================== install docker ===================";
curl -fsSL https://get.docker.com | bash

#install kind
echo "================== install kind ===================";
#https://kind.sigs.k8s.io/docs/user/quick-start/#installing-from-release-binaries
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.13.0/kind-linux-amd64
chmod +x ./kind
mv kind /usr/local/bin

echo "================== install kubectl ===================";
#install kubectl
curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg

echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list

apt-get update
apt-get install -y kubectl

#autocomplet
source <(kubectl completion bash)
echo "source <(kubectl completion bash)" >> ~/.bashrc

#######Configurar meu ssh para acessar meu github######

kind create cluster