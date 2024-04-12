
module "vpc" {
  source            = "./modules/infra/custom-vpc"
  vpc-name          = var.vpc-name
  vpc-cidr          = var.vpc-cidr
  ig-name           = var.ig-name
  public-sg-name    = var.public-sg-name
  private-sg-name   = var.private-sg-name
  public-cidr       = var.public-cidr
  private-cidr      = var.private-cidr
  public-rt-name    = var.public-rt-name
  private-rt-name   = var.private-rt-name
  default-nacl-name = var.default-nacl-name
  private-nacl-name = var.private-nacl-name
  anywhere-cidr     = var.anywhere-cidr
}

module "public-subnets" {
  depends_on    = [module.vpc]
  for_each      = var.public-subnets
  source        = "./modules/infra/subnets"
  vpc-id        = module.vpc.vpc-id
  subnet-name   = each.value["name"]
  subnet-cidr   = each.value["cidr"]
  subnet-az     = each.value["az"]
  public-ip-req = true
  rt-id         = module.vpc.public-rt-id
  nacl-id       = module.vpc.public-nacl-id
}
