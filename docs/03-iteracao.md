# Iteracao e benchmarks

## Objetivo

Aprender `times`, `each`, `map`, `reduce` e como testar repeticoes.

## Exemplo

`Repeater#repeat` constroi uma string repetindo texto.

```ruby
expect(repeater.repeat("ha", 3)).to eq("hahaha")
```

## Refatoracao possivel

Depois de passar com um loop manual, Ruby permite simplificar:

```ruby
text * times
```

A refatoracao so deve acontecer depois do teste verde.

## Benchmark

Use a biblioteca padrao:

```ruby
require "benchmark"

Benchmark.bm do |x|
  x.report("manual") { 10_000.times { Repeater.new.repeat("a", 100) } }
end
```

## Exercicios

1. Implemente primeiro com `times`.
2. Refatore para `text * times`.
3. Compare as duas versoes com `Benchmark`.
