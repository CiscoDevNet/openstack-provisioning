data "openstack_identity_role_v3" "customer_role" {
  name = "admin"
}

// Create a group
resource "openstack_identity_group_v3" "customer_group" {
  name        = var.customer_name
  description = "A group of users dedicated to ${var.customer_name}"

  depends_on = [openstack_identity_project_v3.myProject]

}

// Create a user in the given group
resource "openstack_identity_user_v3" "customer_user" {
    depends_on = [openstack_identity_project_v3.myProject]
    default_project_id  = openstack_identity_project_v3.myProject.id
    name                = var.customer_name
    description         = "The Admin user for ${var.customer_name}"
    password            = "C1sco123"
    enabled             = true
    ignore_change_password_upon_first_use = true

    multi_factor_auth_enabled = false
    extra = {
        email = "admin@${var.customer_name}"
  }
}


// Membership
resource "openstack_identity_user_membership_v3" "customer_membership" {
  user_id  = openstack_identity_user_v3.customer_user.id
  group_id = openstack_identity_group_v3.customer_group.id
}

// Role
resource "openstack_identity_role_assignment_v3" "role_assignment_1" {
  group_id   = openstack_identity_group_v3.customer_group.id
  project_id = openstack_identity_project_v3.myProject.id
  role_id    = data.openstack_identity_role_v3.customer_role.id
}