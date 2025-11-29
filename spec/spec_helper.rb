# frozen_string_literal: true

require 'support/coverage/all'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.filter_run_when_matching :focus

  config.example_status_persistence_file_path =
    '/tmp/.rspec_examples-nixos-hetzner-dedicated-server'

  config.disable_monkey_patching!

  config.warnings = true

  config.default_formatter = 'doc' if config.files_to_run.one?

  config.profile_examples = ENV.fetch('RSPEC_PROFILE_EXAMPLES', false)
end

require 'support/index'

# NOTE: this one has to be last.
require 'support/coverage/partial'
