action "aap_eda_eventstream_post" "create" {
  config {
    # Required fields, with minimal sane defaults
    limit             = 1
    organization_name = "Default"
    template_type     = "job_template"

    # Must be an object, not a string
    # Start with an empty object; provider will complain if it needs keys.
    event_stream_config = {
      url      = "https://itzvsi-aap-prwdlun.techzone.ibm.com/" # EDA or AAP EDA endpoint
      username = "admin"                                        # hardcoded for now
      password = "dw58IH#}lzt*(5t"                              # hardcoded for now
    }
  }
}