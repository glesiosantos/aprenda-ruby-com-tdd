# Linha de comando e estrutura do projeto

## Objetivo

Separar dominio, entrada HTTP e entrada CLI.

## Estrutura sugerida

```text
lib/
  score_board.rb
  repositories/json_score_repository.rb
  web/app.rb
  cli.rb
spec/
```

## Teste de CLI

Teste a classe que recebe `input` e `output`, nao o terminal real:

```ruby
input = StringIO.new("ana 10\n")
output = StringIO.new

Cli.new(input: input, output: output, board: board).run

expect(output.string).to include("Pontuacao salva")
```

## Exercicios

1. Crie um comando para cadastrar pontuacao.
2. Crie um comando para listar ranking.
3. Garanta que CLI e HTTP usam a mesma regra de dominio.
