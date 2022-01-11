data "aws_ami" "ubuntu_bionic_ami" {
  most_recent = true
  owners      = ["${var.id_compte_owner}"]

  filter {
    name   = "name"
    values = ["${var.nom_ubuntu_ami}"]
  }
}

resource "aws_instance" "alain-ec2" {
  ami               = data.aws_ami.ubuntu_bionic_ami.id
  instance_type     = var.type_instance
  key_name          = var.cle_ssh
  availability_zone = var.region
  security_groups   = ["${var.securite_group}"]
  tags = {
    Name = "${var.admin}-ec2"
  }

  provisioner "local-exec" {
    command = " echo PUBLIC IP: ${var.ip_public} >> ip_ec2.txt"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update -y",
      "sudo apt install -y nginx",
      "sudo systemctl start nginx",
      "sudo systemctl enable nginx"
    ] 
    connection {
      type        = "ssh"
      user        = "${var.utilisateur_ssh}"
      private_key = file("C:/Users/Alain/${var.cle_ssh}.pem")
      host        = "${self.public_ip}"
    }
  }

}