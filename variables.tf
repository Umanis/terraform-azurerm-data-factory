
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
  type        = string
  default     = null
  description = "If defined, the log analytics workspace id for standard logs. Mandatory if enable_standard_analytics is set to 'true'"
}

variable "monitoring_workspace_id" {
  type        = string
  default     = null
  description = "If defined, the log analytics workspace id for monitoring logs."
}

variable "metrics_retention_days" {
  type        = number
  default     = 30
  description = "Metrics retention days."
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

variable "enable_standard_analytics" {
  type        = bool
  default     = false
  description = "Indicates if the log are sent to a specified log analytics workspace."
}

variable "identity_type" {
  description = "Add an Identity (MSI) to the function app. Possible values are SystemAssigned or UserAssigned"
  type        = string
  default     = "SystemAssigned"
}

variable "user_assigned_identity_ids" {
  description = "UserAssigned Identities ID to add to Function App. Mandatory if type is UserAssigned"
  type        = list(string)
  default     = null
}

variable "disabled_logs" {
  description = "Disabled logs. Some datafactory logs are defined with 'enabled = false' by design ; this values specify then to stabilize terraform plan."
  type        = list(string)
  default = [
    "AirflowDagProcessingLogs",
    "AirflowSchedulerLogs",
    "AirflowTaskLogs",
    "AirflowWebLogs",
    "AirflowWorkerLogs",
    "SSISIntegrationRuntimeLogs",
    "SSISPackageEventMessageContext",
    "SSISPackageEventMessages",
    "SSISPackageExecutableStatistics",
    "SSISPackageExecutionComponentPhases",
    "SSISPackageExecutionDataStatistics",
    "SandboxActivityRuns",
    "SandboxPipelineRuns"
  ]
}
