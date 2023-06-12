# Infrastructure as Code (IaC) Examples

## How did you use IaC tools such as Terraform?

Infrastructure as Code is the practice of configuring and provisioning IT infrastructure using code instead of manual operations

During my training I was presented with the task to create a VPC and deploy servers inside using an IaC tool, Terraform.
I wrote the code to take out AWS resources, such as VPC, subnets, internet gateway etc. and the EC2 instances and security groups.

Writing this code meant I could deploy all of those resources rapidly without the need to go through the console or remember all the settings.
Once the code was written, I could reuse it and share with other members of a team so they could achieve the same infrastructure and since it was code it was easy to change the infrastructure, for example if I had to scale up the number of servers.

Terraform and IaC really reduced my time to set up cloud infrastructure and allowed me to destroy the infrastructure just as quickly. So, now if I was asked to create a VPC in the cloud, I have the code so I can easily spin it up in a few minutes, instead of having to replicate the manual process. Overall, benefitting the business since developers can use IaC to quickly create and environments to test their applications and
operations teams can  easily manage large-scale systems, ultimately greatly reducing deployment time and saving the business time and cost, also allows them to respond quicker to changes in requirements.

## How did you use IaC tools such as Ansible?

For one project I was asked to use Ansible to configure servers to install and run an application connected to a database

To do this I created a configuration file called a playbook, that describes the desired state of the infrastructure and the tasks to be executed. For example, installing required packages, configuring web servers, and deploying the application code.

This allowed me to simplify the configuration of servers using easy to read code quickly and without the need to manually log in and install Ansible on the particular servers, since the benefit of Ansible is agentless it only requires it to be installed on the master node. Overall, it allowed me to efficiently manage the servers just using the master node, overall reducing time and cost for a business to configure servers.
