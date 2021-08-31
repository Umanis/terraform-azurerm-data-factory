
variable "custom_location" {
  type        = string
  default     = ""
  description = "Specifies a custom location for the resource."
}

variable "custom_name" {
  type        = string
  default     = ""
  description = "Specifies a custom name for the resource."
}

variable "resource_group_name" {
  type        = string
  description = "Specifies the parent resource group name."
}

variable "custom_tags" {
  type        = map(string)
  default     = {}
  description = "The custom tags to add on the resource."
}

variable "instance_index" {
  type = number
  validation {
    condition     = var.instance_index > 0 && var.instance_index < 100
    error_message = "Must be a 2 dights number."
  }
  description = "Resource type index on the resource group."
}

variable "description" {
  type        = string
  default     = ""
  description = "The resource description."
}

variable "standard_analytics_workspace_id" {
  type    = string
  default = null
}

variable "monitoring_workspace_id" {
  type    = string
  default = null
}

variable "metrics_retention_days" {
  type    = number
  default = 30
}

variable "caf_prefixes" {
  type        = list(string)
  default     = []
  description = "Prefixes to use for caf naming."
}

variable "name_separator" {
  type        = string
  description = "Name separator"
  default     = "-"
}
