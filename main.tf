## Defination of Cloud provider ##
provider "aws" {
  

region = "ap-south-1"
}

## Provision of EC2 server##
resource "aws_instance" "demo" {

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
       echo "[webserver]">/home/vm/terraform/inventory.ini
       echo "${self.public_ip} ansible_user=ubuntu ansible_ssh_private_key_file=/home/vm/terraform/devops1.pem" >> /home/vm/terraform/inventory.ini
       sleep 60
       ansible-playbook /home/vm/terraform/playbook.yaml -i /home/vm/terraform/inventory.ini
       echo "Ansible & Terraform successfully run"        
       EOT 
     }
}
