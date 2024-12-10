resource "aws_instance" "web" {
  ami                    = "ami-06650ca7ed78ff6fa"     
  instance_type          = "t2.large"
  key_name               = "kp-instance3"            
  vpc_security_group_ids = [aws_security_group.Jenkins-VM-SG.id]
  provisioner "remote-exec" {
    
    inline = [
      # Install Jenkins
    "sudo apt update -y",
    "wget -O - https://packages.adoptium.net/artifactory/api/gpg/key/public | tee /etc/apt/keyrings/adoptium.asc",
    "echo \"deb [signed-by=/etc/apt/keyrings/adoptium.asc] https://packages.adoptium.net/artifactory/deb $(awk -F= '/^VERSION_CODENAME/{print$2}' /etc/os-release) main\" | tee /etc/apt/sources.list.d/adoptium.list",
    "sudo apt update -y",
    "sudo apt install openjdk-17-jre -y",
    "java --version",
    "curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null",
    "echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null",
    "sudo apt-get update -y",
    "sudo apt-get install jenkins -y",
    "sudo systemctl start jenkins",

    # Install Docker
    "sudo apt-get update -y",
    "sudo apt-get install docker.io -y",
    "sudo usermod -aG docker ubuntu",
    "sudo usermod -aG docker jenkins",  
    "newgrp docker",
    "sudo chmod 777 /var/run/docker.sock",

    # Install Trivy
    "sudo apt-get install wget apt-transport-https gnupg lsb-release -y",
    "wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | gpg --dearmor | sudo tee /usr/share/keyrings/trivy.gpg > /dev/null",
    "echo \"deb [signed-by=/usr/share/keyrings/trivy.gpg] https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main\" | sudo tee -a /etc/apt/sources.list.d/trivy.list",
    "sudo apt-get update -y",
    "sudo apt-get install trivy -y",

    # Install aws cli
    "curl \"https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip\" -o \"awscliv2.zip\"",
    "sudo apt install unzip -y",
    "unzip awscliv2.zip",
    "sudo ./aws/install",
    "aws --version",

    # Install eksctl
    "curl --silent --location \"https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz\" | tar xz -C /tmp",
    "cd /tmp",
    "sudo mv /tmp/eksctl /bin",
    "eksctl version",

    ]
    
    connection {
    type = "ssh"
    user = "ubuntu"
    private_key = file("/home/fadhinotgr/Documents/PSO/kp-instance3.pem")
    host = self.public_ip
    
    }
    
    }

  tags = {
    Name = "Jenkins server"
  }

  root_block_device {
    volume_size = 40
  }
}

resource "aws_security_group" "Jenkins-VM-SG" {
  name        = "Jenkins-VM-SG"
  description = "Allow TLS inbound traffic"

  ingress = [
    for port in [22, 80, 443, 8080, 9000, 3000] : {
      description      = "inbound rules"
      from_port        = port
      to_port          = port
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Jenkins-VM-SG"
  }
}