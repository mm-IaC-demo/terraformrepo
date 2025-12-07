# Project Overview

This project is a Terraform setup for deploying a two-tier architecture on Azure. It consists of a virtual network with a subnet and a Linux virtual machine. The project is structured to support multiple environments (dev, prod, test) and uses a naming convention to ensure unique resource names.

## Building and Running

To deploy the infrastructure, you will need to have Terraform installed and configured with Azure credentials.

### Initialize Terraform

Navigate to the desired environment directory (e.g., `environments/dev`) and run the following command to initialize Terraform:

```bash
terraform init
```

### Plan the Deployment

After initializing, you can create an execution plan to see what resources will be created:

```bash
terraform plan -var-file="dev.tfvars"
```

### Apply the Changes

To deploy the resources, run the following command:

```bash
terraform apply -var-file="dev.tfvars"
```

## Development Conventions

*   **Environments:** Each environment (dev, prod, test) has its own directory under `environments`. Each environment has its own `main.tf`, `variables.tf`, and `.tfvars` file.
*   **Modules:** The project uses modules to create the network and compute resources. This promotes reusability and separation of concerns.
*   **Naming Convention:** Resources are named using a convention that includes the environment, a name prefix, and a unique identifier (e-g `rg-dev-demo-ab123`). This helps to avoid naming conflicts.
*   **Tags:** Resources are tagged with information about the environment, owner, and team.
