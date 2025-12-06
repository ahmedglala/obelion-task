module "network" {
  source = "./modules/network"
  }
  module "key_pair" {
  source = "./modules/key_pair"


}
module "security_groups" {
  source = "./modules/security_groups"

  vpc_id            = module.network.vpc_id
  }
  module "ec2" {
  source = "./modules/ec2"

  public_subnet_id = module.network.public_subnet_id
  ec2_sg_id        = module.security_groups.ec2_sg_id
  key_name         = module.key_pair.key_name
  
}
module "rds" {
  source = "./modules/rds"

  private_subnet_ids = module.network.private_subnet_ids   # ← جديد
  rds_sg_id          = module.security_groups.rds_sg_id
  vpc_id             = module.network.vpc_id
}
module "monitoring" {
  source = "./modules/monitoring"

  frontend_instance_id = module.ec2.frontend_id
  backend_instance_id  = module.ec2.backend_id
  alert_email          = var.alert_email
}