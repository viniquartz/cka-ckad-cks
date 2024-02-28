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
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"

echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check

# no root user ->   # sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
                    # sudo chmod +x kubectl
                    # sudo mkdir -p ~/.local/bin
                    # sudo mv ./kubectl ~/.local/bin/kubectl


kubectl version --client --output=yaml

#autocomplet
echo 'source <(kubectl completion bash)' >>~/.bashrc
echo 'alias k=kubectl' >>~/.bashrc
echo 'complete -o default -F __start_kubectl k' >>~/.bashrc

source ~/.bashrc

#######Configurar meu ssh para acessar meu github######

kind create cluster