require "spec_helper"
require_relative "../lib/calculator"

RSpec.describe Calculator do
  subject(:calculator) { described_class.new }

  describe "#add" do
    it "soma dois numeros" do
      expect(calculator.add(2, 3)).to eq(5)
    end
  end

  describe "#multiply" do
    it "multiplica dois numeros" do
      expect(calculator.multiply(4, 5)).to eq(20)
    end
  end
end
