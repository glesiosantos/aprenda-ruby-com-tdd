require "spec_helper"
require_relative "../lib/greeter"

RSpec.describe Greeter do
  describe ".hello" do
    it "cumprimenta o mundo por padrao" do
      expect(described_class.hello).to eq("Ola, mundo!")
    end

    it "cumprimenta uma pessoa pelo nome" do
      expect(described_class.hello("Ruby")).to eq("Ola, Ruby!")
    end

    it "permite escolher outro idioma" do
      expect(described_class.hello("Ruby", language: :en)).to eq("Hello, Ruby!")
    end
  end
end
