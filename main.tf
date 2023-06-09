resource "aws_iam_user" "rk" {
  name = "loadbalancer"
  path = "/system/"
  tags = {
    tag-key = "tag-value"
  }
}
resource "aws_iam_access_key" "key" {
  user = aws_iam_user.rk.name
}
data "aws_iam_policy_document" "doc" {
  statement {
    effect    = "Allow"
    actions   = ["ec2:Describe*"]
    resources = ["*"]
  }
}
resource "aws_iam_user_policy" "attach" {
  name   = "test"
  user   = aws_iam_user.rk.name
  policy = data.aws_iam_policy_document.doc.json
}
resource "aws_iam_virtual_mfa_device" "example" {
  virtual_mfa_device_name = "example"
  

}
