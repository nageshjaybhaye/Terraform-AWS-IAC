variable "instance_type" {
    description = "The type of instance to start"
    type        = string
    default     = "t3.micro"
}

variable "aws_region" {
    description = "The AWs region to deploy the ec2 instance"
    type = string
    default = "us-east-2"
}

variable "ami_id" {
    description = "The AMI ID to use for the instance"
    type        = string
    default     = "ami-07062e2a343acc423"
}

variable "server_count" {
    description = "The number of instances to create"
    type        = number
    default     = 1
}

variable "instance_name" {
  description = "EC2 instance name"
  type        = string
  default     = "nginx-server"
}

variable "volume_size" {
  description = "Root volume size"
  type        = number
  default     = 8
}