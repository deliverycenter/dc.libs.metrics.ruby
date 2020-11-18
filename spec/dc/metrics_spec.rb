RSpec.describe Dc::Metrics do
  it "has a version number" do
    expect(Dc::Metrics::VERSION).not_to be nil
  end

  describe 'Gem configuration' do
    it "has configuration variables" do
      # TODO: check behaviour of method
      expect(Dc::Metrics).to respond_to(:configuration)
    end

    it "can reset configuration" do
      # TODO: check behaviour of method
      expect(Dc::Metrics).to respond_to(:reset)
    end
  end
end
