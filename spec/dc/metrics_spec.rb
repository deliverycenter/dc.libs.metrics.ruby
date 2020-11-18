RSpec.describe Dc::Metrics do
  it "has a version number" do
    expect(Dc::Metrics::VERSION).not_to be nil
  end

  describe 'Gem configuration' do
    it "accepts block for configuration" do
      expect(false).to eq(true)
    end

    it "can reset configuration" do
      expect(false).to eq(true)
    end
  end
end
