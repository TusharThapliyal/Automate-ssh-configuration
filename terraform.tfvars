region = "us-east-1"
#used in network module
cidr_vpc   = "10.0.0.0/16"
cidr_subet = "10.0.1.0/24"
az         = "us-east-1a"
#used in instance module
instance_type       = "t2.micro"
host_os             = "mac-linux" #change this to host_os="windows" for windows users
host_interpreter     = ["bash", "-c"]
# for windows host_interpreter = ["powershell", "-command"]
