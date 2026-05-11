# JSON, rotas e persistencia simples

## Objetivo

Evoluir a aplicacao Rack para responder JSON e persistir dados.

## Teste sugerido

```ruby
get "/players/ana"

expect(last_response.content_type).to include("application/json")
expect(JSON.parse(last_response.body)).to eq({ "name" => "ana", "score" => 10 })
```

## Persistencia

Comece com um repositorio em memoria. Depois troque por arquivo JSON mantendo o mesmo contrato:

```ruby
repository.find_player("ana")
repository.save_score("ana", 10)
```

## Exercicios

1. Retorne ranking em JSON.
2. Persista ranking em arquivo.
3. Ordene ranking por pontuacao.
