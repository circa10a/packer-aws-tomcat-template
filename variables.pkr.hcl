variable "aws_access_key" {
  type = string
}
variable "aws_secret_key" {
  type = string
}
variable "region" {
  type    = string
  default = "us-east-1"
}
variable "tomcat_version" {
  type    = string
  default = "9.0.43"
}
variable "java_version" {
  type    = string
  default = "1.8.0"
}
variable "install_dir" {
  type        = string
  default     = "/tomcat"
  description = "Directory to install tomcat in"
}
variable "service_file" {
  type        = string
  default     = "tomcat.service"
  description = "Name of service to register with systemd (Ex. tomcat.service)"
}
