class Repeater
  def repeat(text, times)
    raise ArgumentError, "times must be non-negative" if times.negative?

    result = +""
    times.times { result << text }
    result
  end
end
