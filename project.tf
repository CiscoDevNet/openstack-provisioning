
// Create a project
resource "openstack_identity_project_v3" "myProject" {
  name        = var.customer_name
  description = "A project dedicated to ${var.customer_name}"
}



