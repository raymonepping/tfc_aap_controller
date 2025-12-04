variable "aap_host" {
  type        = string
  description = "Base URL of the AAP controller"
  default     = "https://itzvsi-aap-prwdlun.techzone.ibm.com"
}

variable "aap_username" {
  type        = string
  sensitive   = true
  description = "AAP username (ignored if aap_token is set)"
}

variable "aap_password" {
  type        = string
  sensitive   = true
  description = "AAP password (ignored if aap_token is set)"
}

variable "aap_token" {
  type        = string
  sensitive   = true
  description = "AAP API token (recommended). If non-empty, overrides username and password."
  default     = ""
}

provider "aap" {
  host = var.aap_host

  # Token auth preferred. If this is set, the provider ignores username and password.
  token = var.aap_token

  # Fallback: basic auth. Used only if token is empty.
  username = var.aap_username
  password = var.aap_password
}
