curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
cd /tmp
sudo mv /tmp/eksctl /bin
eksctl version

# setup kubernetes cluster
eksctl create cluster --name gym-pso-cluster --region us-east-1 --node-type t2.small --nodes 3
