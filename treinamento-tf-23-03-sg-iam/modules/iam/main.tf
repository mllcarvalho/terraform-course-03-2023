data "aws_caller_identity" "current" {}

resource "aws_iam_policy" "policy" {
  for_each    = var.iam_policies
  name        = each.key
  path        = each.value.path
  policy      = file(each.value.document)
}

resource "aws_iam_role" "role" {
  for_each           = var.iam_roles
  name               = each.key
  assume_role_policy = file(each.value.trust_policy_document)
}


resource "aws_iam_role_policy_attachment" "attachment" {
  count      = length(local.attached)
  role       = local.attached[count.index].role
  policy_arn = replace(local.attached[count.index].attach,"ACCOUNT_ID",data.aws_caller_identity.current.id)
  depends_on = [aws_iam_policy.policy, aws_iam_role.role]
}