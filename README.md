##This repository is for automate of EC2 provision with configure of required packages via CICD concept and run static html website on EC2##
##Tools used :-
1- Jenkins for CICD
2- Terraform for EC2 provision
3- Ansible for configure required packages on nwely launched EC2

Execution:-
Tools Setup on server//// clone this repository and only use .sh extension file to setup tools //
1-local server or cloud VM where we will install all required tools(Terraform, Ansbile, Jenkins) & start Jenkins.
  For this already .sh extension file in repository just make this file with your user right permission and execute it .## chmod 700 .sh && ./.sh  ==> It will install all required packages .

  If all good post successfully execution script file then it should be shown on your console //

  
Jenkins & Ansible and Terraform Installed successfully.

  ##Login to AWS console ##Manual approach##
   
  1-1st Create a access-key under (IAM)/Security credentials and download the file------It will be used for terraform to connect AWS authnetication purpose //remember  i created this as my root user logged on AWS
  2-Then create EC2 key-pair for Ansbile connect with launched EC2 from Terraform to run playbook
  3-Create a Security group with inbod rule port 22(for SSH) with your system IP where jenkins is running,80(Static HTML website run) with 0.0.0.0/0 only testing purpose//// can be also used default sg but ensure setting


Jenkins GUI setup//


  1-Open your browser and paste the ip of your server ## 192.3.4.5(for reference):8080
  2-Need to do setup as usual we do initial setup of user with pass(take the path shown of jenkins page and paste it on server for password) on initial page
  3-Then install recommanded plugins 
  
  Needs to setup of AWS access key id & secret key along with pem file on Jenkins 

  Manage Jnekins==> Credentials
  then do setup 

  Note- In my case I have used secret text for AWS access & secret and secret file private key file (.pem extension) and attached here  

<img width="1545" height="441" alt="image" src="https://github.com/user-attachments/assets/ed96461c-e132-4ec7-8a92-c8e829b7f57f" />

Install required plugings:-

Manage Jnekins==> Plugins

Terraform, Ansible & Pipeline

<img width="940" height="472" alt="image" src="https://github.com/user-attachments/assets/e18fc9f1-1bcf-4ed7-a68f-527719e3ba8a" />


Once it is done then restart jenkins server via http://ip of your jenkins server:8080/restart...


##Automate provision EC2 on AWS and configure required packages along with static website setup on EC2##


Now moving to automate vm provision on AWS and configure the packages .

since in step-1 already clone the repository so you should have all the setup files . but for jenkins cicd pipelin need to create a Job with pipeline so again all codes from scm will download to your workspace .

1-Create a new Job with pipe line .
2-Pipeline script from scm and save it .
3-Now click on build and if all are good then after successfully pipeline run 
you will be able to see like this-

<img width="602" height="47" alt="image" src="https://github.com/user-attachments/assets/6731b74e-9c54-41b6-8095-1903ab96c7ef" />

take the public ip of newly ec2 and open it on browser to see your static website .

<img width="959" height="478" alt="image" src="https://github.com/user-attachments/assets/0166922d-bfd5-4723-bc89-86351f682aca" />




##########################3

Thanks !










  


  

  



