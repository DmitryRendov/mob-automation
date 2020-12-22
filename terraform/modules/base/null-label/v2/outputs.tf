output "id" {
  value       = local.id
  description = "Disambiguated ID"
}

output "id_brief" {
  value       = local.id_brief
  description = "Brief disambiguated ID, limited to 64 characters"
}

output "role_name" {
  value       = local.role_name
  description = "Normalized role name"
}

output "environment" {
  value       = local.environment
  description = "Normalized environment"
}

output "attributes" {
  value       = local.attributes
  description = "Normalized attributes"
}

output "s3_bucket_name" {
  value       = local.s3_bucket_name
  description = "Normalized S3 bucket names"
}

output "tags" {
  value       = local.tags
  description = "Normalized Tag map"
}

output "team" {
  value       = local.team
  description = "Normalized team name"
}

output "delimiter" {
  value       = var.delimiter
  description = "Delimiter used for joining lists internally"
}
