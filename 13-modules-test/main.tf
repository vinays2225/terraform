module "main" {
  source          = "../ec2-instance-mod"
  project         = "roboshop"
  environment     = "dev"
  component       = "mangodb"
  security-groups = ["sg-07305c208ea935c3c"]

}