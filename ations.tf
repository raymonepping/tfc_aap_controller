action "aap_eda_eventstream_post" "create" {
  config {
    # Required fields, with minimal sane defaults
    limit             = 1
    organization_name = "Default"
    template_type     = "job_template"

    # Must be an object, not a string
    # Start with an empty object; provider will complain if it needs keys.
    event_stream_config = {}
  }
}
