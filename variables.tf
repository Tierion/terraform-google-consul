# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# These parameters must be supplied when consuming this module.
# ---------------------------------------------------------------------------------------------------------------------

variable "gcp_project" {
  description = "The name of the GCP Project where all resources will be launched."
}

variable "gcp_region" {
  description = "The region in which all GCP resources will be launched."
}

variable "consul_server_cluster_name" {
  description = "The name of the Consul Server cluster. All resources will be namespaced by this value. E.g. consul-server-prod"
}

variable "consul_server_cluster_tag_name" {
  description = "The tag the consul server Compute Instances will look for to automatically discover each other and form a cluster. TIP: If running more than one Consul Server cluster, each cluster should have its own unique tag name. If you're not sure what to put for this value, just use the value entered in var.cluster_name."
}

variable "consul_server_source_image" {
  description = "The Google Image used to launch each node in the Consul Server cluster."
}

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# ---------------------------------------------------------------------------------------------------------------------

variable "consul_server_cluster_size" {
  description = "The number of nodes to have in the Consul Server cluster. We strongly recommended that you use either 3 or 5."
  default     = 3
}

variable "encrypt_key" {
  description = "Specifies the secret key to use for encryption of Consul network traffic. This key must be 16-bytes that are Base64-encoded"
  default     = "__EMPTY__"
}

variable "consul_server_allowed_inbound_cidr_blocks_http_api" {
  description = "A list of CIDR-formatted IP address ranges from which the Compute Instances will allow API connections to Consul."
  type        = "list"
  default     = ["0.0.0.0/0"]
}

variable "consul_server_allowed_inbound_cidr_blocks_dns" {
  description = "A list of CIDR-formatted IP address ranges from which the Compute Instances will allow TCP DNS and UDP DNS connections to Consul."
  type        = "list"
  default     = []
}
