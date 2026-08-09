variable "resource_group" {
  description = "Map of Resource Groups"

  type = map(object({
    name     = string
    location = string
  }))
}