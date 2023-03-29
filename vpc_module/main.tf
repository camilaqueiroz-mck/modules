resource "aws_vpc" "vpc_default" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name="vpc_${var.env}"
  }
}

# Subnets

resource "aws_subnet" "public_subnet_default" {
  count = length(var.azs)    
  vpc_id = aws_vpc.vpc_default.id
  cidr_block = element(var.subnet_public_cidr_blocks,count.index)
#   cidr_block = "10.0.${count.index*16}.0/24"
  availability_zone = element(var.azs, count.index)
  tags = {
    Name="subnet_public_${var.azs[count.index]}_${var.env}"
  }
}

resource "aws_subnet" "private_subnet_default" {
  count = length(var.azs)    
  vpc_id = aws_vpc.vpc_default.id
  cidr_block = element(var.subnet_private_cidr_blocks,count.index)
#   cidr_block = "10.0.${count.index*16}.0/24"
  availability_zone = element(var.azs, count.index)
  tags = {
    Name="subnet_private_${var.azs[count.index]}_${var.env}"
  }
}

resource "aws_internet_gateway" "igw_default" {
  vpc_id = aws_vpc.vpc_default.id
  tags = {
        Name = "igw_${var.env}"
  }
}

resource "aws_nat_gateway" "nat_gateway_default" {
  count = length(var.azs)
  allocation_id = aws_eip.eip_default[count.index].id
  subnet_id = aws_subnet.public_subnet_default[count.index].id
  depends_on = [
    aws_internet_gateway.igw_default
  ]
  tags = {
    Name = "nat_gateway_${var.azs[count.index]}_${var.env}"
  }
}

resource "aws_eip" "eip_default" {
    count = length(var.azs)
    tags = {
        Name = "eip_${var.azs[count.index]}_${var.env}"
    }
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc_default.id
  tags = {
    Name = "publics_subnets_rt_${var.env}"
  }
}

resource "aws_route_table" "private_route_table" {
  count = length(var.azs)
  vpc_id = aws_vpc.vpc_default.id
  tags = {
    Name = "privates_subnets_rt_${var.azs[count.index]}_${var.env}"
  }
}

resource "aws_route_table_association" "public_rt_association" {
    count = length(var.azs)
    subnet_id = aws_subnet.public_subnet_default[count.index].id
    route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "private_rt_association" {
    count = length(var.azs)
    subnet_id = aws_subnet.private_subnet_default[count.index].id
    route_table_id = aws_route_table.private_route_table[count.index].id
}

resource "aws_route" "public_rt_igw" {
  route_table_id = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.igw_default.id
}

resource "aws_route" "private_rt_igw" {
  count = length(var.azs)
  route_table_id = aws_route_table.private_route_table[count.index].id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.nat_gateway_default[count.index].id
}