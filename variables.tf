# Variables with validations (conditions | error_messages)


variable "owner" {
  type        = string
  description = "Specify the owner of the resource"
  default     = "system Team"
}

variable "description" {
  type        = string
  description = "Provide a description of the resource"
  default     = ".."
}

variable "environment" {
  type        = string
  description = "This variable defines the environment to be built"
  default     = "dev"
}


variable "project_name" {
  description = "Project Name"
  type        = string
  default     = "Rnd-Common"

  validation {
    condition     = length(trimspace(var.project_name)) >= 5 && length(trimspace(var.project_name)) <= 20 && can(regex("[[:alpha:]]", var.project_name))
    error_message = "Project Name should consist of alpha characters only (Min 5, Max 20)."
  }
}


variable "region" {
  description = "geogrphicaly Location"
  type        = string
  default     = "westeurope"

  validation {
    condition     = contains(["westeurope"], lower(var.region))
    error_message = "The Project Location is not valid."
  }
}


variable "project_tags" {
  description = "Project Level Tags"
  type        = map(string)
  default = {
    environment = ""
    version     = ""
  }
}


# kv Service Variables
variable "kv_secret_perm" {
  description = "list of kv secrets permission"
  type        = list(string)
  default = [
    "get",
    "set",
    "list",
    "delete",
    "purge",
  ]
}

variable "kv_key_perm" {
  description = "list of kv key permission"
  type        = list(string)
  default = [
    "create",
    "list",
    "get",
  ]
}

variable "kv_cert_perm" {
  description = "list of kv certificate permission"
  type        = list(string)
  default = [
    "get",
    "list",
    "update",
  ]
}