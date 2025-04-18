resource "aws_shield_proactive_engagement" "test" {
  enabled = true

  dynamic "emergency_contact" {
    for_each = var.emergency_contacts
    content {
      contact_notes = emergency_contact.value.contact_notes
      email_address = emergency_contact.value.email_address
      phone_number  = emergency_contact.value.phone_number
    }
  }

  depends_on = [aws_shield_drt_access_role_arn_association.DRT_Access]
}

variable "emergency_contacts" {
  description = "List of emergency contacts for proactive engagement"
  type        = list(object({
    contact_notes = string
    email_address = string
    phone_number  = string
  }))
  default = []
}

