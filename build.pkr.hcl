build {
  sources = [
    "source.amazon-ebs.tomcat"
  ]
  provisioner "shell" {
    environment_vars = [
      "TOMCAT_VERSION=${var.tomcat_version}",
      "JAVA_VERSION=${var.java_version}"
    ]
    script = "./files/install_tomcat.sh"
  }
  provisioner "file" {
    source      = "./files/${var.service_file}"
    destination = "/tmp/${var.service_file}"
  }
  provisioner "shell" {
    inline = [
      "sudo mv /tmp/${var.service_file} /etc/systemd/system/${var.service_file}",
      "sudo systemctl daemon-reload",
      "sudo systemctl enable ${var.service_file}"
    ]
  }
}
