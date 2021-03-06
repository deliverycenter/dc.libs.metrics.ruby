# frozen_string_literal: true

require 'dc/metrics/pub_sub'
require 'json'
require 'protos/metrics_pb'
require 'time'

module Dc
  module Metrics
    class Logger
      def log(level, message, metadata)
        begin
          return if Metrics.configuration.disabled?

          base_model = build_base_model(level, message, metadata)

          log_to_stdout(base_model)
          log_to_metrics(base_model)
        rescue StandardError => e
          puts "[Error][Dc::Metrics] #{e.message}"      if e.message != nil
          puts "[Error][Dc::Metrics] #{e.backtrace[0]}" if e.backtrace[0] != nil
        end
      end

      private

      def log_to_stdout(base_model)
        stdout_payload = build_stdout_payload(base_model)
        puts JSON(stdout_payload)
      end

      def build_stdout_payload(base_model)
        {
          message: base_model[:message],
          modelLog: base_model,
          severity: base_model[:level]
        }
      end

      def log_to_metrics(base_model)
        metrics_payload = build_metrics_payload(base_model)
        make_metrics_request(metrics_payload)
      end

      def build_metrics_payload(base_model)
        metrics_data = base_model.reject { |k, _v| %i[message payload].include?(k) }
        metrics_data[:create_timestamp] = to_google_timestamp(metrics_data[:create_timestamp])
        DeliveryCenter::Logging::Integration::V1::WriteMetricsRequest.new(metrics_data)
      end

      def make_metrics_request(write_metrics_request_protob)
        Metrics::PubSub.new.publish(write_metrics_request_protob)
      end

      def build_base_model(level, message, metadata)
        {
          level:                level.to_s.upcase,
          message:              message,
          caller:               Metrics.configuration.caller,
          environment:          Metrics.configuration.environment,
          correlation_id:       build_correlation_id(metadata),
          create_timestamp:     Time.now.to_i * (10**9) + Time.now.nsec,
          action:               metadata[:action],
          direction:            metadata[:direction],
          source_type:          metadata[:source_type],
          source_name:          metadata[:source_name],
          duration_ms:          metadata[:duration_ms],
          root_resource_type:   metadata[:root_resource_type],
          ext_root_resource_id: metadata[:ext_root_resource_id].to_s,
          int_root_resource_id: metadata[:int_root_resource_id].to_s,
          child_resource_type:  metadata[:child_resource_type],
          child_resource_id:    metadata[:child_resource_id].to_s,
          ext_store_id:         metadata[:ext_store_id].to_s,
          int_store_id:         metadata[:int_store_id].to_s,
          error_code:           metadata[:error_code],
          payload:              metadata[:payload]
        }
      end

      def to_google_timestamp(nanoseconds)
        Google::Protobuf::Timestamp.new(
          seconds: nanoseconds / 1_000_000_000,
          nanos: nanoseconds % 1_000_000_000
        )
      end

      def build_correlation_id(metadata)
        [
          metadata[:source_type],
          metadata[:source_name],
          metadata[:ext_root_resource_id],
          metadata[:int_root_resource_id]
        ].join('-')
      end
    end
  end
end
