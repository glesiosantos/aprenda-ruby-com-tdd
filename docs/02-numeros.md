# Numeros e documentacao viva

## Objetivo

Usar testes pequenos para documentar operacoes numericas e nomes de metodos.

## Exemplo

`lib/calculator.rb` contem `add` e `multiply`.

```ruby
expect(calculator.add(2, 3)).to eq(5)
expect(calculator.multiply(4, 5)).to eq(20)
```

## Particularidade Ruby

Numeros sao objetos:

```ruby
3.odd?
10.times { puts "Ruby" }
```

Isso torna a linguagem expressiva, mas nao substitui bons nomes de dominio. `wallet.deposit(10)` comunica melhor do que `balance += 10` espalhado pelo sistema.

## Exercicios

1. Adicione `subtract`.
2. Adicione `divide` e teste divisao por zero.
3. Crie exemplos com inteiros e decimais usando `BigDecimal`.
