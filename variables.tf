variable "location" {

  default = "ap-south-1"
}

variable "ami" {

  default = "ami-006935d9a6773e4ec"
}

variable "instance_type" {

  default = "t2.medium"
}

variable "sg-name" {

  default = "terraformsg"
}

variable "key_name" {

  default = "ecommerce"
}

variable "vpc-id" {

  default = "vpc-0148dfdd6f9809e78"
}

variable "subnet-id" {

  default = "subnet-028f99952292bf5d4"
}

variable "instance_name" {

  default = "jenkins"
}
