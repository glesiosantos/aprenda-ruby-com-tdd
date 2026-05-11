# Arrays, ranges e enumerables

## Objetivo

Trabalhar com colecoes usando a API `Enumerable`.

## Teste sugerido

```ruby
RSpec.describe Scores do
  it "soma pontuacoes" do
    expect(Scores.sum([1, 2, 3])).to eq(6)
  end
end
```

## Conceitos

- `Array` guarda listas ordenadas.
- `Range` representa sequencias como `(1..5)`.
- `Enumerable` fornece `map`, `select`, `reduce`, `any?`, `all?`.

## Ruby idiomatico

```ruby
numbers.reduce(0, :+)
numbers.select(&:even?)
users.map(&:email)
```

Use essas formas quando deixam a intencao mais clara. Um loop explicito ainda e aceitavel quando a regra tem varias etapas.

## Exercicios

1. Some todos os numeros de uma lista.
2. Some varias listas recebidas como argumentos.
3. Retorne apenas os numeros pares.
4. Calcule media, menor e maior valor.
