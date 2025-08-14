## Defination of Cloud provider ##
provider "aws" {
  

region = "ap-south-1"
}

## Provision of EC2 server##
resource "aws_instance" "ram" {

    instance_type = "t2.micro"
    ami = "ami-0f918f7e67a3323f0"
    key_name = "devops1"
    vpc_security_group_ids = ["sg-0c45f7acda962c78b"]
    tags = {
        Name= "Developer Server"  
    }
#### After provision now will create inventory.ini ###
     provisioner "local-exec" {
        command = <<EOT
       export ANSIBLE_HOST_KEY_CHECKING=False
       echo "[webserver]">/var/lib/jenkins/workspace/Ansible_CICD/inventory.ini
       echo "${self.public_ip} ansible_user=ubuntu" >> /var/lib/jenkins/workspace/Ansible_CICD/inventory.ini
       sleep 60
       echo "Terraform successfully run and Inventory created"        
       EOT 
     }
}
