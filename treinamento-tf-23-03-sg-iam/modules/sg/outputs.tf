output "security_group_id" {
  value = {for k, v in aws_security_group.sg : k => v.id}
}

output "security_group_arn" {
  value = {for k, v in aws_security_group.sg : k => v.arn}
}

/*
sg_arn = {
  "alb-sg" = "arn:aws:ec2:us-east-1:499618786969:security-group/sg-03f77412e8e880ffd"
  "ec2-sg" = "arn:aws:ec2:us-east-1:499618786969:security-group/sg-0c22f69056897908a"
}
sg_id = {
  "alb-sg" = "sg-03f77412e8e880ffd"
  "ec2-sg" = "sg-0c22f69056897908a"
}
*/


/*

output "security_group_id" {
  value = [
    for sg in aws_security_group.sg : sg.id
  ]
}

output "security_group_arn" {
  value = [
    for sg in aws_security_group.sg : sg.arn
  ]
}

sg_arn = [
  "arn:aws:ec2:us-east-1:499618786969:security-group/sg-03f77412e8e880ffd",
  "arn:aws:ec2:us-east-1:499618786969:security-group/sg-0c22f69056897908a",
]
sg_id = [
  "sg-03f77412e8e880ffd",
  "sg-0c22f69056897908a",
]

*/