variable "location" {
  description = "Regiao onde os recursos serao criados na Azure"
  type        = string
  default     = "West Europe"
}

variable "account_tier" {
  description = "Tier da Storage Account na Azure"
  type        = string
  default     = "Standard"
}

variable "account_replication_type" {
  description = "Tipo de replicaçao de dados da Storage Account"
  type        = string
  default     = "LRS"
}

variable "resource_group_name" {
  description = "Nome para o Resource Group na Azure"
  type        = string
  default     = "rg-custo-terraform"
}

variable "storage_account_name" {
  description = "Nome da Storage Account n Azure"
  type        = string
  default     = "wermessonfacundo02"
}

variable "container_name" {
  description = "Nome do Container na Azure"
  type        = string
  default     = "container-terraform"
}