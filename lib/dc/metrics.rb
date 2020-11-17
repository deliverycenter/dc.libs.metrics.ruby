require "dc/metrics/version"
require "dc/metrics/configuration"

module Dc
  module Metrics
    class Error < StandardError; end
    # Your code goes here...

    class << self
      attr_accessor :configuration
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
