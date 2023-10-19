packer {
  required_plugins {
    amazon = {
      version = ">= 1.2.1"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "linux" {
  ami_name      = "custom-amis/reviews-app/frontend-ami-id"
  instance_type = "t2.micro"
  region        = "us-east-1"
  source_ami    = "ami-03eb6185d756497f8"
  ssh_username  = "ec2-user"
}

build {
  name    = "my-first-build"
  sources = ["source.amazon-ebs.linux"]

  provisioner "shell" {
    script = "install.sh"

  }


  post-processor "vagrant" {}
  post-processor "compress" {}
}
