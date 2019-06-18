variable "internal_ips" {
  type = "map"
  default = {
    hostname = []
    private_ip_dns = []
  }
}

variable zone_id {
    default = ""
}

variable ttl {
    default = ""
}

variable domain {
    default = ""
}

variable type {
    default = "CNAME"
}