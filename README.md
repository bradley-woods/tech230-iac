# Infrastructure as Code (IaC)

Infrastructure as Code (IaC) is the process of managing and deploying IT infrastructure such as servers, networking devices and other computing resources using code instead of using manual operations.

IaC uses human writeable and machine readable code such as YAML to improve infrastructure configuration and deployments, which would usually have to be set up by logging in via SSH or using a provisioning script.

## Benefits of IaC

Provisioning infrastructure can be a time consuming manual process, especially with physical infrastructure.

With recent shift of physical hardware in data centres to the cloud using virtualisation and containerisation, IaC can help a business manage their IT infrastructure while providing consistency, repeatability, and reducing errors involved with manual configuration.

### Benefits

- Cost reduction
- Faster deployments
- Reduction in errors
- Improved consistency
- Configuration drift elimination

## Configuration Management

![Ansible diagram](images/ansible-diagram.png)

Ansible is an automation tool which is used for configuration management.

With Ansible, you can manage and facilitate multiple servers regardless of cloud provider. It can communicate with the servers simultaneously to perform different tasks.

It is agentless which means only the master node (Ansible controller) needs Ansible and the agent nodes do not need Ansible installed on them.

Ansible uses Playbooks written in YAML to produce repeatable, re-usable and simple configurations of multi-machine deployments to automate IT infrastructure.
