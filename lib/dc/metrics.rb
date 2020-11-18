require "dc/metrics/version"
require "dc/metrics/configuration"
require "dc/logger"

module Dc
  module Metrics
    class Error < StandardError; end
    # Your code goes here...

    class << self
      attr_accessor :configuration
    end

    def self.debug(message, metadata)
      l = Logger.new
      l.log(:debug, message, metadata)
    end

    def self.info(message, metadata)
      l = Logger.new
      l.log(:info, message, metadata)
    end

    def self.warn(message, metadata)
      l = Logger.new
      l.log(:warn, message, metadata)
    end

    def self.error(message, metadata)
      l = Logger.new
      l.log(:error, message, metadata)
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
