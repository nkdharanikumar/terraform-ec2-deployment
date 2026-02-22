resource "aws_key_pair" "example" {
  key_name   = var.key_name
  public_key = file(var.public_key_path)
}

resource "aws_vpc" "myvpc" {
  cidr_block = var.cidr
}

resource "aws_subnet" "publicsubnet" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = var.subnet_cidr
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.myvpc.id
}

resource "aws_route_table" "publicroute_table" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "rtassociation" {
  subnet_id      = aws_subnet.publicsubnet.id
  route_table_id = aws_route_table.publicroute_table.id
}

resource "aws_security_group" "webSg" {
  name   = "web-sg"
  vpc_id = aws_vpc.myvpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "pyinstance" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.publicsubnet.id
  vpc_security_group_ids = [aws_security_group.webSg.id]
  key_name               = aws_key_pair.example.key_name

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file(var.private_key_path)
    host        = self.public_ip
  }

  provisioner "file" {
    source      = "app.py"
    destination = "/home/ubuntu/app.py"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update -y",
      "sudo apt install -y python3-venv",
      "cd /home/ubuntu",
      "python3 -m venv venv",
      "venv/bin/pip install flask",
      "sudo nohup venv/bin/python app.py > output.log 2>&1 &"
    ]
  }
}