module Dc
  module Metrics
    class Configuration
      attr_accessor :caller, :environment, :gcp_project_id, :pubsub_topic_name

      def initialize
        @caller = nil
        @environment = nil
        @gcp_project_id = nil
        @pubsub_topic_name = nil
      end
    end
  end
end
