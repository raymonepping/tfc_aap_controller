resource "aap_inventory" "my_inventory" {
  name         = "My new inventory"
  description  = "A new inventory for testing"
  organization = 1

  variables = jsonencode({
    foo = "bar"
  })
}

resource "aap_group" "my_group" {
  inventory_id = aap_inventory.my_inventory.id
  name         = "tf_group"

  variables = jsonencode({
    foo = "bar"
  })
}

resource "aap_host" "my_host" {
  inventory_id = aap_inventory.my_inventory.id
  name         = "tf_host"

  variables = jsonencode({
    foo = "bar"
  })

  groups = [aap_group.my_group.id]
}

# resource "aap_job" "zos_ping" {
#  job_template_id = 11

# wait_for_completion                 = true
#  wait_for_completion_timeout_seconds = 300

#  depends_on = [
#    aap_host.my_host,
#    aap_group.my_group,
#  ]
#}

resource "aap_job" "zos_ping" {
  job_template_id                     = 11
  wait_for_completion                 = true
  wait_for_completion_timeout_seconds = 300

  depends_on = [
    aap_host.my_host,
    aap_group.my_group,
  ]

  # Quick & dirty: fire an HCP Action after this job is created
  lifecycle {
    action_trigger {
      # This is the key idea:
      # "after_create" is the moment the resource has been successfully created.
      # Please confirm the exact enum string in the HCP docs.
      events = ["after_create"]

      # This must point at a real Action resource in your config / org.
      # I cannot verify the exact type/name from here, so treat this as a placeholder.
      actions = [
        action.aap_eda_eventstream_post.create
      ]
    }
  }
}
