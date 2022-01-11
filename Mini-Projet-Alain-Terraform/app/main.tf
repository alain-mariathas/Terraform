#Instanciation module sg
module "sg" {
  source        = "../modules/sg"
  admin = "app-allan"
}

#Instanciation module ebs
module "ebs" {
  source        = "../modules/ebs"
  capacite_disque = 5
  admin = "app-allan"
}

# Instanciation module eip
module "eip" {
  source        = "../modules/eip"
  admin = "app-allan"
}
# Instanciation module ec2
module "ec2" {
  source        = "../modules/ec2"
  admin        = "app-allan"
  type_instance = "t2.micro"
  securite_groupe= "${module.sg.out_sg_nom}"
  ip_public = "${module.eip.out_eip_public_ip}"
  utilisateur_ssh = "ubuntu"
}



resource "aws_eip_association" "eip_assoc" {
  instance_id = module.ec2.out_ec2_id
  allocation_id = module.eip.out_eip_id
}

resource "aws_volume_attachment" "ebs_to_ec2" {
  device_name = "/dev/sdf"
  volume_id   = module.ebs.out_volume_id
  instance_id = module.ec2.out_ec2_id
}



