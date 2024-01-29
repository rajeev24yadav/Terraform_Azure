variable "raj_rg" {
  type = map(object({
    name     = string
    location = string
    tags     = optional(map(string))
    })
  )
}