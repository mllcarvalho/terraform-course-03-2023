module "sg" {
  source          = "./modules/sg"
  security_groups = var.security_groups
  env             = var.env
}

module "iam" {
  source       = "git::https://github.com/mllcarvalho/module-iam.git?ref=release-1.0.0"
  iam_policies = var.iam_policies
  iam_roles    = var.iam_roles
}