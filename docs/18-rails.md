# Puxando para Rails

## Objetivo

Aplicar os mesmos principios em uma aplicacao Rails.

## Mapeamento mental

- Objeto de dominio em Ruby vira `app/models` ou `app/services`.
- Repositorio em memoria vira Active Record.
- App Rack vira controllers e routes.
- Teste HTTP vira request spec.
- Capybara vira system spec.
- Injecao de dependencia continua util em services, jobs e clients externos.

## Primeiro fluxo Rails

1. Crie o app:

```bash
rails new placar --database=sqlite3
cd placar
```

2. Adicione RSpec:

```bash
bundle add rspec-rails --group "development, test"
bin/rails generate rspec:install
```

3. Escreva um system spec com Capybara antes da tela existir:

```ruby
RSpec.describe "Ranking", type: :system do
  it "cadastra uma pontuacao" do
    visit root_path
    fill_in "Jogador", with: "Ana"
    fill_in "Pontuacao", with: "10"
    click_button "Salvar"

    expect(page).to have_content("Ana")
    expect(page).to have_content("10")
  end
end
```

Esse teste deve falhar primeiro porque a rota, a tela e a persistencia ainda nao existem. A falha guia o proximo passo.

## Descendo a piramide

Depois do system spec falhar, implemente em camadas pequenas:

1. Crie uma rota raiz para `scores#index`.
2. Crie um model `Score` com `player` e `points`.
3. Escreva model specs para validacoes.
4. Escreva request specs para `POST /scores`.
5. Volte ao system spec e faca o fluxo completo passar.

## Exemplo de model spec

```ruby
RSpec.describe Score, type: :model do
  it "exige jogador" do
    score = described_class.new(player: "", points: 10)

    expect(score).not_to be_valid
    expect(score.errors[:player]).to be_present
  end
end
```

## Exemplo de request spec

```ruby
RSpec.describe "Scores", type: :request do
  it "cadastra uma pontuacao" do
    post scores_path, params: { score: { player: "Ana", points: 10 } }

    expect(response).to redirect_to(root_path)
    expect(Score.last.player).to eq("Ana")
  end
end
```

## Ordem de estudo em Rails

1. Model specs para validacoes e regras simples.
2. Request specs para contrato HTTP.
3. System specs para fluxos criticos.
4. Service objects quando uma regra nao pertence claramente a um model ou controller.
5. Jobs com Active Job e adapters de teste.

## Capybara em Rails

System specs ja integram Rails e Capybara. Para fluxo sem JavaScript, o driver padrao costuma bastar. Para fluxo com JavaScript, configure um driver de navegador e mantenha poucos testes desse tipo, cobrindo apenas jornadas criticas.

## Exercicios finais

1. Crie um Rails app de ranking.
2. Implemente cadastro de pontuacao com TDD.
3. Adicione validacoes no model.
4. Crie ranking ordenado.
5. Cubra o fluxo principal com Capybara.
6. Extraia uma regra para service object e teste isoladamente.

## Fechamento

O objetivo nao e testar tudo pela interface nem testar cada linha isoladamente. O objetivo e criar uma piramide saudavel: muitos testes de unidade para regras, alguns testes de request para contratos e poucos testes Capybara para fluxos que realmente importam.
