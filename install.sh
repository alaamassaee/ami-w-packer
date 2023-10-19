!/bin/bash
sudo yum update -y
sudo amazon-linux-extras install nginx1
sudo systemctl start nginx
sudo systemctl enable nginx
sudo scp /Users/khazar/Desktop/packer/application/index.html /usr/share/nginx/html/index.html

