# Infrastructure as Code (IaC)

## Contents of Repository

   1. [Ansible - Controller Setup](https://github.com/bradley-woods/tech230-iac/blob/main/ansible-controller-setup.md)

## What is IaC?

Infrastructure as Code (IaC) is the process of managing and deploying IT infrastructure such as servers, networking devices and other computing resources using code instead of using manual operations.

IaC uses human writeable and machine readable code such as YAML to improve infrastructure configuration and deployments, which would usually have to be set up by logging in via SSH or using a provisioning script.

## Benefits of IaC

Provisioning infrastructure can be a time consuming manual process, especially with physical infrastructure.

With recent shift of physical hardware in data centres to the cloud using virtualisation and containerisation, IaC can help a business manage their IT infrastructure while providing consistency, repeatability, and reducing errors involved with manual configuration.

- Cost reduction
- Faster deployments
- Reduction in errors
- Improved consistency
- Configuration drift elimination

## Configuration Management using Ansible

Ansible is an automation tool which is used for configuration management. It can be used to automate provisioning, configuration and management of IT infrastructure and install services, resources, applications etc. inside the VM.

With Ansible, you can manage and facilitate multiple servers regardless of cloud provider. It can communicate with the servers simultaneously to perform different tasks.

Ansible uses Playbooks written in YAML to describe the tasks to be performed on the VMs quickly which can produce repeatable, re-usable and simple configurations of multi-machine deployments to automate IT infrastructure.

### Benefits of Ansible

- **Free** - Ansible is an open-source tool
- **Agentless** - Only the master (control node) needs Ansible and the agents (managed nodes) do not need Ansible installed on them
- **Efficient** - No extra software needed so more capacity for app resources on the server
- **Flexible** - Can configure entire app environment no matter where its deployed (public cloud, hybrid, on-prem, CentOS, Ubuntu etc.)
- **Powerful** - Can model complex infrastructure and workflows
- **Simple and easy** - No special coding skills required to use Ansible playbooks as it uses human friendly YAML code

## Orchestration using Terraform

Terraform is an orchestration tool.
