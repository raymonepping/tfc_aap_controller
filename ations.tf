action "aap_eda_eventstream_post" "create" {
  config {
    # Best-effort reasonable defaults, adjust based on provider errors

    # Probably a number: how many items / records to pull or send
    limit = 1

    # Your AAP org name (from the UI)
    organization_name = "Default"

    # Likely something like "job_template" vs "workflow_job_template"
    # This is a guess; provider will complain if it's wrong.
    template_type = "job_template"

    # Provider wants *something* here; the schema only tells us it's required,
    # not its type. Treat it as a JSON blob to start with.
    event_stream_config = jsonencode({
      # TODO: fill this once the provider tells us what it expects.
      # For now, an empty object just satisfies "required".
    })
  }
}
