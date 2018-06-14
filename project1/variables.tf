#####################################################################
##
##      Created 6/14/18 by ucdpadmin. for project1
##
#####################################################################

variable "unique_resource_name" {
  description = "A unique name for the resource, required by GCE."  
  default= ""
}

variable "machine_type" {
  description = "The machine type to create."
  default = "n1-standard-1"
}

variable "public_key" {
  description = "User Public key"  
  default = ""
}

variable "boot_disk" {
  description = "The boot disk for the instance."
  default = "centos-cloud/centos-7"
}

variable "zone" {
  description = "The zone the resource should be created in."
  default = "us-central1-a"
}

