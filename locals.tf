locals {
  project_name = "terraform-demo"
  environment  = "dev"

  common_prefix = "${local.project_name}-${local.environment}"

  project_name_upper = upper(local.project_name)
  environment_upper  = upper(local.environment)

  project_name_clean = replace(local.project_name, "-", "_")

  formatted_name = format(
    "%s-%s",
    local.project_name,
    local.environment
  )
}
