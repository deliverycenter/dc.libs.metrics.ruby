# frozen_string_literal: true

# TODO: Improve tests to cover the class behaviour
RSpec.describe Dc::Metrics::Logger do
  describe 'Class instance interface' do
    it 'can log a message' do
      expect(Dc::Metrics::Logger.new).to respond_to(:log)
    end
  end
end
