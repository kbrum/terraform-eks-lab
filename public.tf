resource "aws_subnet" "eks_subnet_public_1a" {
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = cidrsubnet(var.cidr_block, 8, 1)
  availability_zone       = "${data.aws_region.current.region}a"
  map_public_ip_on_launch = true
  tags = merge(local.tags, {
    Name                     = "${var.project_name}-public-1a"
    "kubernetes.io/role/elb" = 1
  })
}

resource "aws_subnet" "eks_subnet_public_1b" {
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = cidrsubnet(var.cidr_block, 8, 2)
  availability_zone       = "${data.aws_region.current.region}b"
  map_public_ip_on_launch = true
  tags = merge(local.tags,
    {
      Name                     = "${var.project_name}-public-1b"
      "kubernetes.io/role/elb" = 1
  })
}

resource "aws_route_table" "eks_lab_public_rt" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.eks_lab_igw.id
  }

  tags = merge(local.tags,
    {
      Name = "${var.project_name}-pub-rt"
  })
}

resource "aws_route_table_association" "pub_ass_rt_1a" {
  subnet_id      = aws_subnet.eks_subnet_public_1a.id
  route_table_id = aws_route_table.eks_lab_public_rt.id
}

resource "aws_route_table_association" "pub_ass_rt_1b" {
  subnet_id      = aws_subnet.eks_subnet_public_1b.id
  route_table_id = aws_route_table.eks_lab_public_rt.id
}
