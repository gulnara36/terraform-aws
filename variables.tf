variable "ami" {
  type = string
}
variable "prdx_inst_type" {
  type = string
}
variable "images" {
  type = map(any)
}
variable "videos" {
  type = map(any)
}
variable "default" {
  type = map(any)
}
variable "key_name" {
  type = string
}
variable "tags" {
  type    = map(any)
  default = {}
}
variable "cidr_blocks" {
  type = string
}
variable "prdx_sub1" {
  type = map(any)
}
variable "prdx_sub2" {
  type = map(any)
}
