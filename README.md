# Using Terraform to create remote development using ssh

creating a remote development environment on AWS using ```provisioner "local-exec"``` in Terraform.

## Installation
1. Initialise terraform directory

```bash
terraform init
```
2. run terraform plan

```bash
terraform plan
```
3.Provision AWS infrastructure

```bash
terraform apply -auto-approve
```
## Description of architecture on AWS
After running the above command you will have :
- vpc (10.0.0.0/16)
- public subnet(10.0.1.0/24)
- internet gateway and route table 
- security group allowing ssh and http to '0.0.0.0/0'
- ec2 instance
- latest ami_id is pulled using datasource "aws_ami"

## provisioner "local-exec"
local-exec is used to run commands on your local machiner after ``terraform apply`` command is used.

 command =templaterfile() will lok for the file specified and run commands in that file.

In this code, local-exec will run a ``mac-ssh-config.tpl`` file containing necessary code to create a local ssh development environment.

```hcl
provisioner "local-exec" {
    command     = templatefile("${var.host_os}-ssh-config.tpl", 
   { hostname = self.public_ip, user = "ubuntu", identityfile = "~/.ssh/aws_key_pair" })
    interpreter = var.host_interpreter
  }
```
variables are defined in ``terraform.tfvars``
```hcl
host_interpreter=["bash","-c"] # replace it with ["powershell","-command"] for windows user

host_os=mac # replace it with "windows" for windows user
```
## Setting up Remote development using ssh
 - create a ``mac-ssh-config.tpl`` file
```bash
cat << EOF >> ~/.ssh/config

Host ${hostname}
    HostName ${hostname}
    User ${user}
    IdentityFile ${identityfile}
EOF
```

for windows use ```windows-ssh-config.tpl``` file
```powershell
add-content -path c:/users/tusharthapliyal/.ssh/config -value @'

Host ${hostname}
    HostName ${hostname}
    User ${user}
    IdentityFile ${identityfile}

'@
```
variables for this file will are defined within provisioner block.

## VS code extensions
Download remote ssh extension in VScode to connect to your remote instance.
