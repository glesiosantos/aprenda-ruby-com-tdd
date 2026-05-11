require "spec_helper"
require_relative "../lib/greeter"

RSpec.describe Greeter do
  describe ".hello" do
    context "without arguments" do
      it "greets the world" do
        expect(described_class.hello).to eq("Ola, mundo!")
      end
    end

    context "with a name" do
      it "greets the person" do
        expect(described_class.hello("Ruby")).to eq("Ola, Ruby!")
      end
    end

    context "with another language" do
      it "uses that language" do
        expect(described_class.hello("Ruby", language: :en)).to eq("Hello, Ruby!")
      end
    end
  end
end
