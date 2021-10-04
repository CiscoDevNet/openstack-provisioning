// create a compute quota
resource "openstack_compute_quotaset_v2" "quota_compute" {
  depends_on = [openstack_identity_project_v3.myProject]

  project_id           = openstack_identity_project_v3.myProject.id
  key_pairs            = 7
  ram                  = 40960
  cores                = 2
  instances            = 3
  server_groups        = 4
  server_group_members = 5
  fixed_ips            = 2
  floating_ips         = 2
  injected_file_content_bytes = 4096
  injected_file_path_bytes    = 0
  injected_files              = 0
  metadata_items              = 0
  security_group_rules        = 3
  security_groups             = 3
}

resource "openstack_networking_quota_v2" "quota_network" {
    depends_on = [openstack_identity_project_v3.myProject]

    project_id          = openstack_identity_project_v3.myProject.id
    floatingip          = 1
    network             = 1
    port                = 1
    rbac_policy         = 1
    router              = 1
    security_group      = 1
    security_group_rule = 1
    subnet              = 1
    subnetpool          = 2
}

resource "openstack_blockstorage_quotaset_v2" "quota_volume" {
    depends_on = [openstack_identity_project_v3.myProject]

    project_id           = openstack_identity_project_v3.myProject.id
  volumes              = 10
  snapshots            = 4
  gigabytes            = 100
  per_volume_gigabytes = 10
  backups              = 4
  backup_gigabytes     = 10
  groups               = 100
  /*
  volume_type_quota = {
    volumes_ssd   = 30
    gigabytes_ssd = 500
    snapshots_ssd = 10
  }
  */
}