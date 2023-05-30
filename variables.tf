variable "location" {

  default = "ap-south-1"
}

variable "ami" {

  default = "ami-025b4b7b37b743227"
}

variable "instance_type" {

  default = "t2.medium"
}

variable "sg-name" {

  default = "terraformsg"
}

variable "key_name" {

  default = "Pavan"
}

variable "vpc-id" {

  default = "vpc-03e2773fff3ea1931"
}

variable "subnet-id" {

  default = "subnet-0a12b02e254d94319"
}

variable "instance_name" {

  default = "jenkins"
}

variable "sonar_instance_name" {

  default = "sonarqube"
}
