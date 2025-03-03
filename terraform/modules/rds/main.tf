data "aws_secretsmanager_secret" "db_secret" {
  name = var.secret_name
}

data "aws_secretsmanager_secret_version" "db_secret_version" {
  secret_id = data.aws_secretsmanager_secret.db_secret.id
}

resource "aws_db_instance" "db" {
  identifier        = var.rds_name
  engine            = "mysql"
  engine_version    = "8.0"
  instance_class    = "db.t3.micro"
  allocated_storage = 20
  username          = "admin"
  password          = jsondecode(data.aws_secretsmanager_secret_version.db_secret_version.secret_string)["db_password"]
  db_name           = "mydb"
  multi_az          = false
  storage_type      = "gp2"
  publicly_accessible = false  # Disable public access
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.main.name
}

resource "aws_security_group" "rds_sg" {
  name        = "${var.rds_name}-sg"
  description = "Security group for RDS"
  vpc_id      = var.vpc_id
}

resource "aws_db_subnet_group" "main" {
  name       = "${var.rds_name}-subnet-group"
  subnet_ids = var.private_subnets
}
