# frozen_string_literal: true

require 'dc/metrics/version'
require 'dc/metrics/configuration'
require 'dc/metrics/logger'

module Dc
  module Metrics
    class Error < StandardError; end
    # Your code goes here...

    def self.debug(message, metadata)
      logger.log(:debug, message, metadata)
    end

    def self.info(message, metadata)
      logger.log(:info, message, metadata)
    end

    def self.warn(message, metadata)
      logger.log(:warn, message, metadata)
    end

    def self.error(message, metadata)
      logger.log(:error, message, metadata)
    end

    def self.logger
      @logger ||= Metrics::Logger.new
    end

    def self.configuration
      @configuration ||= Configuration.new
    end

    def self.reset
      @configuration = Configuration.new
    end

    def self.configure
      yield(configuration)
    end
  end
end
