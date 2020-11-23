# frozen_string_literal: true

require 'protos/metrics_pb'
require 'base64'
require 'google/cloud/pubsub'

module Dc
  module Metrics
    class PubSub
      attr_reader :pub_sub, :topic

      def initialize
        @pub_sub = Google::Cloud::PubSub.new(**cloud_params)
        @topic = pub_sub.topic(Metrics.configuration.pubsub_topic_name)
      end

      def publish(message)
        t = Thread.new{
          begin
          encoded_data = DeliveryCenter::Logging::Integration::V1::WriteMetricsRequest.encode(message)
          response = topic.publish(encoded_data)
          rescue StandardError => e
            puts "[Error][Dc::Metrics] #{e.message}"      if e.message != nil
            puts "[Error][Dc::Metrics] #{e.backtrace[0]}" if e.backtrace[0] != nil
            puts "[Error][Dc::Metrics] #{e.backtrace[1]}" if e.backtrace[1] != nil
          end
        }
        Metrics.add_pending_thread(t)
        Metrics.clean_pending_threads
      end

      private

      def cloud_params
        {
          project_id:  Metrics.configuration.gcp_project_id,
          credentials: Metrics.configuration.gcp_credentials_path
        }
      end
    end
  end
end
