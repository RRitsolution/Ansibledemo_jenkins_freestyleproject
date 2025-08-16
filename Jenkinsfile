pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID      = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY  = credentials('AWS_SECRET_ACCESS_KEY')
        AWS_REGION             = "ap-south-1"
		
    }

    stages {
        stage('Checkout code') {
            steps {
                git branch: 'main', url: 'https://github.com/RRitsolution/Automation-of-Infracture-provision-and-configure-packages_CICD_Jenkins_Terraform_Ansible.git'
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan -out=tfplan'
            }
        }

        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve tfplan'
            }
        }

        stage('Run Ansible Playbook') {
            steps {
                withCredentials([file(credentialsId: 'EC2_PEM_FILE', variable: 'SSH_KEY_FILE')]) {
                    sh """
                    # Set correct permissions for the SSH key and inventory file.
                    chmod 400 "${SSH_KEY_FILE}"
                    chmod 400 "${WORKSPACE}/inventory.ini"

                    # Explicitly override any conflicting settings to use the key provided by Jenkins.
                    # The --private-key flag should be used, and this version of the script
                    # ensures it is passed correctly.
                    ansible-playbook -i "${WORKSPACE}/inventory.ini" "${WORKSPACE}/playbook.yaml" \\
                      --private-key "${SSH_KEY_FILE}" \\
                      --ssh-extra-args="-o StrictHostKeyChecking=no"
                    """
                }
            }
        }
    }

    post {
        failure {
            echo "Pipeline failed. Check the console logs for details."
        }
    }
}
