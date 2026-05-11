require "spec_helper"
require_relative "../lib/wallet"

RSpec.describe Wallet do
  it "guarda saldo inicial" do
    wallet = described_class.new(10)

    expect(wallet.balance).to eq(10)
  end

  it "recebe depositos" do
    wallet = described_class.new

    wallet.deposit(25)

    expect(wallet.balance).to eq(25)
  end

  it "retorna falso quando nao ha saldo para saque" do
    wallet = described_class.new(10)

    expect(wallet.withdraw(11)).to be(false)
    expect(wallet.balance).to eq(10)
  end

  it "saca quando ha saldo" do
    wallet = described_class.new(10)

    expect(wallet.withdraw(7)).to be(true)
    expect(wallet.balance).to eq(3)
  end
end
