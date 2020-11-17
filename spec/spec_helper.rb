require "bundler/setup"
require "dc/metrics"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before(:all) do
    Dc::Metrics.configure do |config|
      config.caller            = 'application_name'
      config.env               = 'test'
      config.gcp_project_id    = 'project_id'
      config.pubsub_topic_name = 'topic_name'
    end
  end
end
