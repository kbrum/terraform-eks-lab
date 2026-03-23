resource "aws_iam_policy" "eks_lb_policy" {
  name = "eks_lb_policy"

  policy = file()
}
