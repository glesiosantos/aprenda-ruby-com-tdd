# Mocks, spies e doubles

## Objetivo

Usar doubles quando observar uma colaboracao e mais importante que o valor retornado.

## Exemplo com spy simples

```ruby
sleeper = SpySleeper.new
countdown.start
expect(sleeper.calls).to eq(3)
```

## Exemplo com RSpec

```ruby
notifier = instance_double("Notifier")
allow(notifier).to receive(:deliver)

service = Checkout.new(notifier: notifier)
service.finish(order)

expect(notifier).to have_received(:deliver).with(order)
```

## Cuidado

Mocks demais tornam testes presos a implementacao. Prefira testar saida observavel. Use mock quando o efeito importante e uma chamada para outro objeto.

## Exercicios

1. Teste que um email e enviado ao finalizar pedido.
2. Teste que email nao e enviado se pagamento falhar.
3. Troque um double solto por `instance_double`.
