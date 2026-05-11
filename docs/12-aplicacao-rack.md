# Aplicacao Rack testada

## Objetivo

Criar uma aplicacao HTTP pequena antes de entrar em Rails.

## Por que Rack

Rack e a camada comum por baixo de muitos frameworks Ruby web. Entender Rack ajuda a entender Rails sem magia excessiva.

## Teste sugerido

```ruby
RSpec.describe App do
  include Rack::Test::Methods

  def app
    App.new
  end

  it "responde health check" do
    get "/health"
    expect(last_response.status).to eq(200)
    expect(last_response.body).to eq("ok")
  end
end
```

## Exercicios

1. Crie `GET /health`.
2. Crie `GET /players/:name`.
3. Retorne 404 para rota desconhecida.
