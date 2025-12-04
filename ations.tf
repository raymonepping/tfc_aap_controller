action "aap_eda_eventstream_post" "create" {
  # IMPORTANT:
  # This "type" (aap_eda_eventstream_post) MUST be implemented by some provider.
  # The shape of this config block is completely provider-specific.

  config {
    # TODO: fill in according to the provider that actually implements this action.
    # For example, if this were an AWS Lambda action it would look like:
    #
    # function_name = "my_function"
    # payload = jsonencode({ ... })
    #
    # For an AAP EDA action, you need to check the ansible/aap provider docs
    # to see if it exposes an action type and what arguments it expects.
  }
}
