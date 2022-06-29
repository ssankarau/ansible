# Bootstrap AWS Environment using Ansible playbook

This project builds the 3 tier architecture on the aws infra. Also install the sample app(phpMyAdmin) to illustrate the layering behaviour. 

## List of AWS Services deployed
* Key Pairs
* Security Groups
* VPC
* EC2
* ALB

## Prerequsites
Before execute the playbook please make sure that you have installed the latest ansible version. the minimum required `ansible version` is `2.11`. 
some of the ansible modules(aws) requires `2.11`. 
Install `boto3` latest. ansible uses the `botocore` library to bootstrap the aws infra.

## Usage
Clone the Repository, Edit the required configurations.

### Bootstrap
``` 
  export AWS_ACCESS_KEY=<YOUR-AWS-ACCESS-KEY>
  export AWS_SECRET_ACCESS_KEY=<YOUR-SECRET-ACCESS-KEY>
  export region=<SPECIFY REGION NAME>
  export deploy_environment=[dev | test ]
  mkdir -p keys
  cat "abcd123" > .vault-password
  ansible-playbook main.yml -i inventory/local -i inventory/${deploy_environment}-dynamic-inventory --extra-vars="deploy_environment=$deploy_environment $region=region" --vault-password-file .vault-password
```
### Teardown
``` 
  export AWS_ACCESS_KEY=<YOUR-AWS-ACCESS-KEY>
  export AWS_SECRET_ACCESS_KEY=<YOUR-SECRET-ACCESS-KEY>
  export region=<SPECIFY REGION NAME> e.g: us-east-1
  export deploy_environment=[dev | test ]
  ansible-playbook destroy-env.yml -i inventory/local -i inventory/${deploy_environment}-dynamic-inventory --extra-vars="deploy_environment=$deploy_environment $region=region" --vault-password-file .vault-password
```
