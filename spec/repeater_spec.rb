require "spec_helper"
require_relative "../lib/repeater"

RSpec.describe Repeater do
  subject(:repeater) { described_class.new }

  describe "#repeat" do
    subject(:repeat) { repeater.repeat(text, times) }

    let(:text) { "ha" }

    context "with positive times" do
      let(:times) { 3 }

      it "repeats the text" do
        expect(repeat).to eq("hahaha")
      end
    end

    context "with zero times" do
      let(:times) { 0 }

      it "returns an empty string" do
        expect(repeat).to eq("")
      end
    end

    context "with negative times" do
      let(:times) { -1 }

      it "raises an error" do
        expect { repeat }.to raise_error(ArgumentError, "times must be non-negative")
      end
    end
  end
end
