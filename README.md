# AzureTerraformLab


You need to create a secrets.auto.tfvars file to keep the values of these variables:

mikey_subscription_id = "yoursubscription"
mikey_client_id = "client_id number"
mikey_client_secret = "client secret number"
mikey_tenant_id = "tenant id number"

these are outputs from this azure bash command to create a service profile:


az ad sp create-for-rbac --name "somename"