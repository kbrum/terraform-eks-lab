resource "aws_subnet" "eks_subnet_private_1a" {
  vpc_id            = aws_vpc.eks_vpc.id
  cidr_block        = cidrsubnet(var.cidr_block, 8, 3)
  availability_zone = "${data.aws_region.current.region}a"
  tags = merge(var.tags, {
    Name                              = "${var.project_name}-priv-sub-1a"
    "kubernetes.io/role/internal-elb" = 1
  })
}

resource "aws_subnet" "eks_subnet_private_1b" {
  vpc_id            = aws_vpc.eks_vpc.id
  cidr_block        = cidrsubnet(var.cidr_block, 8, 4)
  availability_zone = "${data.aws_region.current.region}b"
  tags = merge(var.tags, {
    Name                              = "${var.project_name}-priv-sub-1b"
    "kubernetes.io/role/internal-elb" = 1
  })
}

resource "aws_route_table" "eks_lab_priv_rt_1a" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.eks_lab_ngw_1a.id
  }

  tags = {
    Name = "${var.project_name}-priv-rt-1a"
  }
}

resource "aws_route_table" "eks_lab_priv_rt_1b" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.eks_lab_ngw_1b.id
  }

  tags = {
    Name = "${var.project_name}-priv-rt-1b"
  }
}

resource "aws_route_table_association" "eks_lab_priv_rt_1a" {
  subnet_id      = aws_subnet.eks_subnet_private_1a.id
  route_table_id = aws_route_table.eks_lab_priv_rt_1a.id
}

resource "aws_route_table_association" "eks_lab_priv_rt_1b" {
  subnet_id      = aws_subnet.eks_subnet_private_1b.id
  route_table_id = aws_route_table.eks_lab_priv_rt_1b.id
}
