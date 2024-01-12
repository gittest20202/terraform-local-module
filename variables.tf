variable "rg_location" {
  type = string
  description = "Region location"
}
variable "rg_name" {
   type = string
   description = "Region name"
variable  "subscription_id" {
   type = string
   description = "Subscription ID"
}
variable "tenant_id" {
   type = string
   description = "Tenant ID"
}
variable "client_id" {
  type = string
  description = "Client ID"
}
variable "client_secret" {
   type = string
   description = "Client Secret"
   sensitive = true
}
