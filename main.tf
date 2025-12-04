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

  lifecycle {
    action_trigger {
      # Single event value, as per the error message
      events = [after_create]
      actions = [
        action.aap_eda_eventstream_post.create
      ]
    }
  }
}
