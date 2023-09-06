## azure_terraform
Creating the AKS cluster infrastructure using Terraform
### Steps
1.Created Resource group and storag account for storing the backend terraform statefiles <br />
2 Created the virtual networks ,subnet,public ip, and application gateway <br />
   - Use the azurerm_virtual_network Terraform resource to create a VNET.
   - Use the azurerm_subnet Terraform resource to create relevant subnets. <br />
3.Created ACR and roles assignments. 
    - Use the azurerm_container_registry Terraform resource to create a new ACR. <br />
4.Created the AKS cluster and IAM role for the deployment.
  - Use the azurerm_kubernetes_cluster Terraform resource to AKS Cluster
  - Use the azurerm_role_assignment Terraform resource to create the two neccessary role assignments<br />
### Run the Terraform codes for creating the infrastructure.
Create the cluster by running the following:
terraform init - To initialize the working directory and pull down the provider
terraform plan - To go through a "check" and confirm the configurations are valid
terraform apply - To create the resource



