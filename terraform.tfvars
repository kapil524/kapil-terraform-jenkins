bucket_name = "dev-proj-1-jenkins-remote-state-bucket-123456"

vpc_cidr             = "10.0.0.0/16"
vpc_name             = "dev-proj-jenkins-ap-south-vpc-1"
cidr_public_subnet   = ["10.0.1.0/24", "10.0.2.0/24"]
cidr_private_subnet  = ["10.0.11.0/24", "10.0.12.0/24"]
eu_availability_zone = ["ap-south-1a", "ap-south-1b"]

public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCympFCszrc/OgpKrTXdIP4AKpKaDVhfPzrR2qVUCxXKO6ysrGzCTBmU1NyISz8nCWb4WR2+MKaHIEtEx+q5t0iLppoOSD7K3atwyKgGN5YfWNzMh8vPIOWa9MZsX7JIc5SIwwElQMHdTVZsnba6GTukDbhNawawd4J0m6eaj/CQkeZ5UpwDLBWQIKqYK1GTd48qUPHswb3DsCx1XOXdWqzPdT7TWMTAa+oC75CdP2wwr2tTuYwKbTPSDIQZMvk45vTu5HwRW9eNUGlRrjfs37/hXZYD1nONHrQ6n1vLUyQ1dz503iYziOKrX0vWBPYjlCtrnEpStHmSoF71DMaS9uJrMyxxPwz7FWhizp6dZKSA1pWs/1ic3jlQ/gWrofPaolLiBPCLbYeK9xs92vsE9IGZh92hO+xQrqzusUzeh26HhRTSCAW4E/AJflmdYZyXSy67D2XLT6IxNxdBo0KU3oZ6cc4axv7UE3zg/bW309pDzLRt+/aEqHy5YXQKo/7qCU= railw@Kapil-PC"
ec2_ami_id = "ami-02d26659fd82cf299"
