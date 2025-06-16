### Internet Gateway ###
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.env}-igw"
  }
}

### Nat Gateway ###
resource "aws_eip" "nat_eip_zone1" {
  domain = "vpc" # This is required for NAT Gateway to work in a VPC

  tags = {
    Name = "${var.env}-nat-eip-${var.zone1}"
  }
}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_eip_zone1.id
  subnet_id     = aws_subnet.public_zone1.id

  depends_on = [aws_internet_gateway.igw]

  tags = {
    Name = "${var.env}-nat-gw-${var.zone1}"
  }
}
