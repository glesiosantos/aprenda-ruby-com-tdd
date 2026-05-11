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
  subject(:countdown) { described_class.new(output: output, sleeper: sleeper) }

  let(:output) { StringIO.new }
  let(:sleeper) { SpySleeper.new }

  describe "#start" do
    subject(:start) { countdown.start(from: 3) }

    it "writes the countdown" do
      start

      expect(output.string).to eq("3\n2\n1\nVai!\n")
    end

    it "sleeps between numbers" do
      start

      expect(sleeper.calls).to eq(3)
    end
  end
end
