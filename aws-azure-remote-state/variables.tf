variable "location" {
  description = "Regiao onde os recursos serao criados na Azure"
  type        = string
  default     = "West Europe"
}

variable "account_tier" {
  description = "Tier da storage account na azure"
  type        = string
  default     = "Standard"
}

variable "account_replication_type" {
  description = "Tipo de replicaçao de dados da storage account"
  type        = string
  default     = "LRS"
}