# Objetos, modulos e contratos

## Objetivo

Modelar comportamento com objetos e entender duck typing.

## Exemplo

`Wallet` guarda saldo, recebe depositos e tenta saques.

```ruby
wallet = Wallet.new(10)
expect(wallet.withdraw(7)).to be(true)
expect(wallet.balance).to eq(3)
```

## Particularidade Ruby

Ruby nao exige que uma classe declare uma interface. O contrato aparece no comportamento esperado:

```ruby
object.call(input)
repository.save(record)
notifier.deliver(message)
```

Se o objeto responde aos metodos esperados, ele serve.

## Modulos

Use modulos para compartilhar comportamento pequeno ou nomear namespaces:

```ruby
module Billing
  class Wallet
  end
end
```

## Exercicios

1. Crie `Wallet#transfer_to(other_wallet, amount)`.
2. Teste que uma transferencia sem saldo nao muda nenhuma carteira.
3. Extraia um modulo `CurrencyFormatter`.
