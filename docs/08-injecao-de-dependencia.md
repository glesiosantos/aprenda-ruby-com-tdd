# Injecao de dependencia e I/O

## Objetivo

Separar regra de negocio de detalhes como tela, arquivo, tempo e rede.

## Exemplo

`Countdown` recebe `output` e `sleeper`.

```ruby
output = StringIO.new
sleeper = SpySleeper.new
Countdown.new(output: output, sleeper: sleeper).start
```

Assim o teste nao espera segundos reais e nao escreve no terminal real.

## Particularidade Ruby

Nao e necessario criar interface formal para `output`. Basta o objeto responder a `puts`. Esse e um uso saudavel de duck typing.

## Exercicios

1. Crie um `Sleeper` real que chama `sleep(1)`.
2. Injete um `logger` em uma classe de pedido.
3. Teste escrita em arquivo usando `StringIO` antes de usar `File`.
