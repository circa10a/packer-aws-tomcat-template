source "amazon-ebs" "tomcat" {
  access_key      = var.aws_access_key
  ami_name        = "tomcat-${var.tomcat_version}-jdk-${var.java_version}-amzn-linux.x86_64-hvm-ebs"
  ami_description = "Apache Tomcat ${var.tomcat_version} with java ${var.java_version} installed and systemd enabled. Based on Amazon linux."
  ami_groups = [
    "all"
  ]
  instance_type = "t2.micro"
  region        = var.region
  secret_key    = var.aws_secret_key
  source_ami_filter {
    filter {
      key   = "virtualization-type"
      value = "hvm"
    }
    filter {
      key   = "root-device-type"
      value = "ebs"
    }
    filter {
      key   = "name"
      value = "amzn2-ami-hvm-2.0.*-x86_64-gp2"
    }
    owners = [
      "amazon"
    ]
    most_recent = true
  }
  ssh_username = "ec2-user"
}
