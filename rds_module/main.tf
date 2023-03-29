resource "aws_db_instance" "default" {
  allocated_storage    = 20
  identifier           = "db_rubi_${var.env}"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  username             = var.db_username
  password             = var.db_password
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  db_subnet_group_name = aws_db_subnet_group.subnet_db_group.id
  vpc_security_group_ids = [aws_security_group.security_group_db.id]
}

resource "aws_security_group" "security_group_db" {
  name        = "security_group_db_${var.env}"
  description = "Allow TLS inbound traffic"
  vpc_id      = var.vpc_id
  ingress {
    description      = "TLS from DB"
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    # cidr_blocks      = [var.cidr_block]
    security_groups = var.eks_sec_group_id
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  tags = {
    Name = "security_group_db_${var.env}"
  }
}

resource "aws_db_subnet_group" "subnet_db_group" {
  name       = "subnet_db_rubi_${var.env}"
  subnet_ids = var.private_subnet_ids[0]
  tags = {
    Name = "subnet_db_rubi_${var.env}"
  }
}