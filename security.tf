resource "aws_security_group" "web" {
  name        = "p02-dev-web-sg"
  description = "Security group do servico web do projeto 02"
  vpc_id      = aws_vpc.main.id

  tags = {
    Project     = "projeto-02"
    Name        = "p02-dev-web-sg"
    Environment = "dev"
    ManagedBy   = "Terraform"
    Owner       = "DiegoSantos"
  }
}

resource "aws_vpc_security_group_ingress_rule" "web_http" {
  security_group_id = aws_security_group.web.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80

  tags = {
    Project     = "projeto-02"
    Name        = "p02-dev-web-sg-http"
    Environment = "dev"
    ManagedBy   = "Terraform"
    Owner       = "DiegoSantos"
  }
}

resource "aws_vpc_security_group_ingress_rule" "web_ssh" {
  security_group_id = aws_security_group.web.id
  cidr_ipv4         = var.ssh_allowed_cidr
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22

  tags = {
    Project     = "projeto-02"
    Name        = "p02-dev-web-sg-ssh"
    Environment = "dev"
    ManagedBy   = "Terraform"
    Owner       = "DiegoSantos"
  }
}

resource "aws_vpc_security_group_egress_rule" "web_all_outbound" {
  security_group_id = aws_security_group.web.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"

  tags = {
    Project     = "projeto-02"
    Name        = "p02-dev-web-sg-egress"
    Environment = "dev"
    ManagedBy   = "Terraform"
    Owner       = "DiegoSantos"
  }
}