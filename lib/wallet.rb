class Wallet
  attr_reader :balance

  def initialize(balance = 0)
    @balance = balance
  end

  def deposit(amount)
    validate_positive!(amount)
    @balance += amount
  end

  def withdraw(amount)
    validate_positive!(amount)
    return false if amount > balance

    @balance -= amount
    true
  end

  private

  def validate_positive!(amount)
    raise ArgumentError, "amount must be positive" unless amount.positive?
  end
end
