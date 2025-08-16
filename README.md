🚀 EC2 Automation with CI/CD

This repository demonstrates how to automate the provisioning of an AWS EC2 instance, configure required packages, and deploy a static HTML website using a CI/CD pipeline.


🔧 Tools Used

Jenkins → CI/CD pipeline

Terraform → EC2 provisioning

Ansible → Configure required packages on EC2

⚙️ Execution Steps
1️⃣ Setup Tools on Server

Use a local server or cloud VM to install Jenkins, Terraform, and Ansible.

Clone this repository and run the provided JenkinsTerraformAnsbilesetup.sh script to install everything:

chmod 700 JenkinsTerraformAnsbilesetup.sh
./JenkinsTerraformAnsbilesetup.sh

If successful, you will see:

Jenkins, Ansible, and Terraform Installed successfully


2️⃣ AWS Console (Manual Setup)

Create an Access Key (IAM → Security Credentials) → used by Terraform for authentication.

Create an EC2 Key Pair → required by Ansible for SSH into the instance.

Create a Security Group:

Port 22 → your local system IP (for SSH)

Port 80 → 0.0.0.0/0 (for website access)
 

3️⃣ Jenkins Setup

Access Jenkins at:

http://<your-server-ip>:8080


Unlock Jenkins using the initial admin password shown on your server.

Install recommended plugins.

Add AWS credentials under:

Manage Jenkins → Credentials

Use Secret Text for AWS keys and Secret File for .pem key.

<img width="1545" height="441" alt="image" src="https://github.com/user-attachments/assets/ed96461c-e132-4ec7-8a92-c8e829b7f57f" />



✅ Required plugins: Terraform, Ansible, Pipeline



<img width="940" height="472" alt="image" src="https://github.com/user-attachments/assets/e18fc9f1-1bcf-4ed7-a68f-527719e3ba8a" />

Restart Jenkins:

http://<your-server-ip>:8080/restart




4️⃣ Automate EC2 Provisioning with CI/CD

In Jenkins, create a New Job → Pipeline.

Select Pipeline script from SCM to fetch code from this repository.

Run the pipeline → Terraform provisions EC2, and Ansible configures it.

<img width="602" height="47" alt="image" src="https://github.com/user-attachments/assets/6731b74e-9c54-41b6-8095-1903ab96c7ef" />



After a successful build, copy the Public IP of the EC2 instance.

take the public ip of newly ec2 and open it on browser to see your static website .

Open the IP in your browser → Static HTML website should be visible 🎉

<img width="959" height="478" alt="image" src="https://github.com/user-attachments/assets/0166922d-bfd5-4723-bc89-86351f682aca" />




##########################

Thanks !










  


  

  



