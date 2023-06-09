# Using Terraform to Deploy Two-Tier Architecture in a VPC <!-- omit in toc -->

- [Installing Terraform](#installing-terraform)
- [Checking Terraform](#checking-terraform)
- [Using Terraform](#using-terraform)

## Installing Terraform

1. Firstly, head to the Terraform website and download it, for Windows it will be an application (.exe) file.

2. Right-click the executable file and 'Run as Administrator'

3. Next, we need to add it to our system environment variables. Go to 'Edit the system environment variables > Advanced > Environment Variables' and add a new 'PATH' variable and paste here the filepath of the 'terraform.exe' file.

4. Also, since we need to give Terraform access to AWS, we can add two new environment variables for the Access Key ID and the Secret Key. Add the first as 'AWS_ACCESS_KEY_ID' and the second as 'AWS_SECRET_ACCESS_KEY', ensuring you do not let anyone see these keys.

5. Once done, click 'Apply' and 'OK'.

## Checking Terraform

1. We can check terraform is installed by opening a new Git Bash terminal and entering the following command to check the version:

    ```bash
    $ terraform --version
    ```

2. If there is an error, then Terraform did not install properly.

## Using Terraform

1. Terraform uses configuration files called 'main.tf' to define the Infrastructure as Code, 'variables.tf' to define any variables to avoid repetition in the main file, and 'outputs.tf' to define any outputs you want to see in the Terminal window after running your Terraform file, such as the Public IP of an EC2 instance.

    > **Note:** the last two files (variables.tf and outputs.tf) are optional

2. Create a new file called 'main.tf' and start coding your infrastructure, for example declaring the cloud provider's name e.g. aws and the resources and services you would like to deploy. An example is shown [here](https://github.com/bradley-woods/tech230-iac/blob/main/main.tf) to deploy two-tier architecture inside a VPC with a public and private subnet, an IGW, a route table and two instances, one for an application to go inside the public subnet and one for a database to go inside the database.

3. Once the 'main.tf' has been created, we can use the following command in the terminal to initialise our directory:

    ```bash
    $ terraform init
    ```

4. Then, we can check the configuration file for any changes and if there will be any errors when launching it, e.g. typos.

    ```bash
    $ terraform plan
    ```

5. If it is successful, we can launch our infrastructure using the following command:

    ```bash
    $ terraform apply
    ```

6. Finally, if we want to destroy infrastructure we can use the following command to destroy it all or specific resources:

    ```bash
    $ terraform destroy 
    
    $ terraform destroy -target=<resource-type>.<resource-name>
    ```
