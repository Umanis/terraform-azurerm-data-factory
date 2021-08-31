# Azure Umanis Data Factory
[![Build Status](https://dev.azure.com/umanis-consulting/terraform/_apis/build/status/mod_azu_datafactory?repoName=mod_azu_datafactory&branchName=master)](https://dev.azure.com/umanis-consulting/terraform/_build/latest?definitionId=4&repoName=mod_azu_datafactory&branchName=master) [![Unilicence](https://img.shields.io/badge/licence-The%20Unilicence-green)](LICENCE)

Common Azure terraform module to create an Data factory component.
## Naming
Resource naming is based on the Microsoft CAF naming convention best practices. Custom naming is available by setting the parameter `custom_name`. We rely on the official Terraform Azure CAF naming provider to generate resource names when available.

## Location
The resource location is the parent resource group location. To specify a custom location, use the `custom_location` parameter.

## Tags
Tags are inherited from parent resource group. To add resource specific tags, use the `custom_tags`
## Usage
```hcl

module "umanis_tagging" {
  source = "Umanis/tags/azurerm"

  location          = "France Central"
  client            = "XY2"
  project           = "1234"
  budget            = "FE4567"
  rgpd_personal     = true
  rgpd_confidential = false
}

module "umanis_naming" {
  source = "Umanis/naming/azurerm"

  location    = "France Central"
  client      = "XY2"
  project     = "1234"
  area        = 1
  environment = "tst"
}

module "umanis_resource_group" {
  source = "Umanis/resource-group/azurerm"

  tags         = module.umanis_tagging.tags
  location     = "France Central"
  description  = "Test resource group"
  caf_prefixes = module.umanis_naming.resource_group_prefixes
}

module "umanis_log_analytics" {
  source = "Umanis/log-analytics-workspace/azurerm"

  resource_group_name = module.umanis_resource_group.name
  description         = "Test log analytics workspace"
  caf_prefixes        = module.umanis_naming.resource_prefixes
  instance_index      = 1
}

module "umanis_data_factory" {
  source = "Umanis/data-factory/azurerm"

  instance_index                      = 1
  resource_group_name                 = module.umanis_resource_group.name
  description                         = "Test application insights"
  caf_prefixes                        = module.umanis_naming.resource_prefixes
  standard_analytics_workspace_id     = module.umanis_log_analytics.id
}

```
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.15.0 |
| <a name="requirement_azurecaf"></a> [azurecaf](#requirement\_azurecaf) | >= 1.2.5 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >=2.62.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_instance_index"></a> [instance\_index](#input\_instance\_index) | Resource type index on the resource group. | `number` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Specifies the parent resource group name. | `string` | n/a | yes |
| <a name="input_caf_prefixes"></a> [caf\_prefixes](#input\_caf\_prefixes) | Prefixes to use for caf naming. | `list(string)` | `[]` | no |
| <a name="input_custom_location"></a> [custom\_location](#input\_custom\_location) | Specifies a custom location for the resource. | `string` | `""` | no |
| <a name="input_custom_name"></a> [custom\_name](#input\_custom\_name) | Specifies a custom name for the resource. | `string` | `""` | no |
| <a name="input_custom_tags"></a> [custom\_tags](#input\_custom\_tags) | The custom tags to add on the resource. | `map(string)` | `{}` | no |
| <a name="input_description"></a> [description](#input\_description) | The resource description. | `string` | `""` | no |
| <a name="input_metrics_retention_days"></a> [metrics\_retention\_days](#input\_metrics\_retention\_days) | Metrics retention days. | `number` | `30` | no |
| <a name="input_monitoring_workspace_id"></a> [monitoring\_workspace\_id](#input\_monitoring\_workspace\_id) | If defined, the log analytics workspace id for monitoring logs. | `string` | `null` | no |
| <a name="input_name_separator"></a> [name\_separator](#input\_name\_separator) | Name separator | `string` | `"-"` | no |
| <a name="input_standard_analytics_workspace_id"></a> [standard\_analytics\_workspace\_id](#input\_standard\_analytics\_workspace\_id) | If defined, the log analytics workspace id for standard logs. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_identity"></a> [identity](#output\_identity) | The assigned identity. |
| <a name="output_name"></a> [name](#output\_name) | The instance name. |
<!-- END_TF_DOCS -->
## Related documentation

Terraform Azure data factory documentation: [https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory)

Terraform Azure CAF Naming documentation: [https://registry.terraform.io/providers/aztfmod/azurecaf/latest/docs/resources/azurecaf_name](https://registry.terraform.io/providers/aztfmod/azurecaf/latest/docs/resources/azurecaf_name)
