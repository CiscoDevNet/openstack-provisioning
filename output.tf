output "OpenStack_Tenant_Name" {
  value = openstack_identity_project_v3.myProject.name
}
output "OpenStack_Tenant_User" {
  value = openstack_identity_user_v3.customer_user.name
}
output "OpenStack_User_Group" {
  value = openstack_identity_group_v3.customer_group.name
}
output "Tenant_Compute_Quota" {
  value = openstack_compute_quotaset_v2.quota_compute
}
output "Tenant_Network_Quota" {
  value = openstack_networking_quota_v2.quota_network
}
output "Tenant_Storage_Quota" {
  value = openstack_blockstorage_quotaset_v2.quota_volume
}