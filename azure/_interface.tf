variable "resource_group_name" {
  type        = "string"
  default     = "myfirstresourcegroup"
  description = "This variable defines the..."
}

variable "resource_group_location" {
  type        = "string"
  default     = "East US"
  description = "This variable defines the..."
}

variable "resource_group_tag" {
  type        = "string"
  default     = "Production"
  description = "A tag required by the company to identify the resource group"
}

variable "vn_name" {
  type        = "string"
  default     = "myfirstvn"
  description = "virtual network name"
}

variable "vn_address_space" {
  type        = "list"
  default     = ["10.0.0.0/16"]
  description = "this is the default open network"
}

variable "vn_location" {
  type        = "string"
  default     = "East US"
  description = "This variable defines the virtual network location"
}

variable "sb_name" {
  type        = "string"
  default     = "myfirstsb"
  description = "subnet name"
}

variable "sb_address_prefix" {
  type        = "string"
  default     = "10.0.4.0/24"
  description = "this is the default subnet prefix"
}
