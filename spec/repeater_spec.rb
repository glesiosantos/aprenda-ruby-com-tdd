require "spec_helper"
require_relative "../lib/repeater"

RSpec.describe Repeater do
  subject(:repeater) { described_class.new }

  it "repete um texto a quantidade pedida" do
    expect(repeater.repeat("ha", 3)).to eq("hahaha")
  end

  it "retorna string vazia quando a quantidade e zero" do
    expect(repeater.repeat("ha", 0)).to eq("")
  end

  it "recusa quantidade negativa" do
    expect { repeater.repeat("ha", -1) }.to raise_error(ArgumentError, "times must be non-negative")
  end
end
