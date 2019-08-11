variable project {
  description = "Project ID"
}

variable region {
  description = "Region"

  # Значение по умолчанию
  default = "europe-west4"
}

variable zone {
  description = "zone"

  # Значение по умолчанию
  default = "europe-west4-c"
}

variable count {
  description = "Count of instance"

  default = 1
}

