resource "aws_ebs_volume" "volume" {
  availability_zone = "${var.region}"
  size              = var.size

  tags = {
    Name = "${var.admin}-ebs"
  }
}