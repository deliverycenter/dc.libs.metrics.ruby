# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: metrics.proto

require 'google/protobuf'

require 'google/protobuf/timestamp_pb'
require 'google/protobuf/empty_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("metrics.proto", :syntax => :proto3) do
    add_message "logging.deliverycenter.integration.v1.WriteMetricsRequest" do
      optional :correlation_id, :string, 1
      optional :environment, :string, 2
      optional :level, :string, 3
      optional :direction, :string, 4
      optional :source_type, :string, 5
      optional :source_name, :string, 6
      optional :caller, :string, 7
      optional :action, :string, 8
      optional :create_timestamp, :message, 9, "google.protobuf.Timestamp"
      optional :duration_ms, :int32, 10
      optional :root_resource_type, :string, 11
      optional :ext_root_resource_id, :string, 12
      optional :int_root_resource_id, :string, 13
      optional :child_resource_type, :string, 14
      optional :child_resource_id, :string, 15
      optional :ext_store_id, :string, 16
      optional :int_store_id, :string, 17
      optional :error_code, :string, 18
    end
  end
end

module DeliveryCenter
  module Logging
    module Integration
      module V1
        WriteMetricsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("logging.deliverycenter.integration.v1.WriteMetricsRequest").msgclass
      end
    end
  end
end