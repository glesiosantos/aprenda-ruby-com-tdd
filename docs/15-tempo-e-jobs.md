# Tempo, jobs e tarefas periodicas

## Objetivo

Testar codigo que depende de horario sem deixar testes lentos ou instaveis.

## Injete relogio

```ruby
class Clock
  def now
    Time.now
  end
end
```

No teste:

```ruby
clock = double(now: Time.utc(2026, 1, 1, 12, 0, 0))
```

## Exercicios

1. Registre o horario de uma pontuacao.
2. Liste pontuacoes do dia.
3. Crie um job que limpa dados antigos recebendo `clock` como dependencia.
