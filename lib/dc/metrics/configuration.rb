# frozen_string_literal: true

module Dc
  module Metrics
    class Configuration
      attr_accessor :caller, :environment, :gcp_project_id, :gcp_credentials_path, :pubsub_topic_name

      def initialize
        @caller = nil
        @environment = nil
        @gcp_project_id = nil
        @pubsub_topic_name = nil
        @gcp_credentials_path = nil
        @disabled = false
      end

      def disable
        @disabled = true
      end

      def disabled?
        @disabled
      end
    end
  end
end
