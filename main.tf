provider "aws" {
  region                  = "eu-central-1"
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "vpn"
}

resource "aws_lightsail_instance" "itm-vpn" {
  name              = "itm-vpn"
  availability_zone = "eu-central-1a"
  blueprint_id      = "ubuntu_18_04"
  bundle_id         = "nano_2_0"
  key_pair_name     = "itm-vpn-keypair"
}

resource "aws_lightsail_key_pair" "itm-vpn-keypair" {
  name       = "itm-vpn-keypair"
  public_key = "${file("~/.ssh/id_itm_vpn_rsa.pub")}"
}

resource "aws_lightsail_static_ip" "itm-vpn-ip" {
  name = "itm-vpn-ip"
}

resource "aws_lightsail_static_ip_attachment" "itm-vpn-ip-attachment" {
  static_ip_name = "${aws_lightsail_static_ip.itm-vpn-ip.name}"
  instance_name  = "${aws_lightsail_instance.itm-vpn.name}"
}

output "instance_ip" {
  value = "${aws_lightsail_static_ip.itm-vpn-ip.ip_address}"
}

output "instance_name" {
  value = "${aws_lightsail_instance.itm-vpn.name}"
}




