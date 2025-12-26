
module "networking" {
  source = "./modules/networking"
  vpc_cidr = "10.0.0.0/16"
  public_subnet_cidr = "10.0.1.0/24"
}

module "s3" {
  source = "./modules/s3"
  bucket_name = "wallace-static-assets-2025"
}

module "cloudfront" {
  source = "./modules/cloudfront"
  bucket_domain = module.s3.bucket_domain
}
