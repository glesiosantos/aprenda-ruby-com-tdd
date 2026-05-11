class Countdown
  def initialize(output:, sleeper:)
    @output = output
    @sleeper = sleeper
  end

  def start(from: 3)
    from.downto(1) do |number|
      output.puts(number)
      sleeper.sleep
    end
    output.puts("Vai!")
  end

  private

  attr_reader :output, :sleeper
end
