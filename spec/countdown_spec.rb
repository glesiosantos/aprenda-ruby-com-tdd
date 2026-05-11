require "spec_helper"
require "stringio"
require_relative "../lib/countdown"

class SpySleeper
  attr_reader :calls

  def initialize
    @calls = 0
  end

  def sleep
    @calls += 1
  end
end

RSpec.describe Countdown do
  it "escreve a contagem e espera entre os numeros" do
    output = StringIO.new
    sleeper = SpySleeper.new

    described_class.new(output: output, sleeper: sleeper).start(from: 3)

    expect(output.string).to eq("3\n2\n1\nVai!\n")
    expect(sleeper.calls).to eq(3)
  end
end
