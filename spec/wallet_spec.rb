require "spec_helper"
require_relative "../lib/wallet"

RSpec.describe Wallet do
  describe "#balance" do
    subject(:wallet) { described_class.new(initial_balance) }

    let(:initial_balance) { 10 }

    it "returns the initial balance" do
      expect(wallet.balance).to eq(10)
    end
  end

  describe "#deposit" do
    subject(:deposit) { wallet.deposit(amount) }

    let(:wallet) { described_class.new }
    let(:amount) { 25 }

    it "increases the balance" do
      expect { deposit }.to change(wallet, :balance).from(0).to(25)
    end
  end

  describe "#withdraw" do
    subject(:withdraw) { wallet.withdraw(amount) }

    let(:wallet) { described_class.new(10) }

    context "when there is enough balance" do
      let(:amount) { 7 }

      it "returns true" do
        expect(withdraw).to be(true)
      end

      it "decreases the balance" do
        expect { withdraw }.to change(wallet, :balance).from(10).to(3)
      end
    end

    context "when balance is not enough" do
      let(:amount) { 11 }

      it "returns false" do
        expect(withdraw).to be(false)
      end

      it "does not change the balance" do
        expect { withdraw }.not_to change(wallet, :balance)
      end
    end
  end
end
