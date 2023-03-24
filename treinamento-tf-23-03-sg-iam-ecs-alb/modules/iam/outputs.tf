/*output "role_arn" {
 // value = aws_security_group.main
  value = [
    for role in aws_iam_role.role : role.arn
  ]
}*/

output "role_arn" {
  value = {for k, v in aws_iam_role.role : k => v.arn}
}