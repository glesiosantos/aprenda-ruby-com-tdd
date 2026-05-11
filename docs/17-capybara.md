# Capybara: testes pelo comportamento do usuario

## Objetivo

Sair de testes de unidade e testar fluxos pela perspectiva de quem usa a aplicacao.

## Quando usar

Use Capybara para comportamento de interface:

- formularios;
- links e botoes;
- mensagens visiveis;
- navegacao;
- integracao entre tela, rota e regra de negocio.

Capybara e mais lento que um teste de unidade. Use para fluxos importantes, nao para cada combinacao pequena de regra de negocio.

## Exemplo

```ruby
RSpec.describe "ranking", type: :feature do
  it "permite cadastrar uma pontuacao" do
    visit "/"
    fill_in "Jogador", with: "Ana"
    fill_in "Pontuacao", with: "10"
    click_button "Salvar"

    expect(page).to have_content("Ana")
    expect(page).to have_content("10")
  end
end
```

Esse teste nao pergunta qual controller foi chamado, qual classe CSS existe ou qual metodo interno salvou a pontuacao. Ele descreve o comportamento que uma pessoa enxerga.

## Configuracao minima fora do Rails

Em uma aplicacao Rack pequena, o spec pode configurar o app assim:

```ruby
require "capybara/rspec"
require_relative "../lib/web/app"

Capybara.app = App.new
```

Com isso, `visit "/"`, `fill_in` e `click_button` exercitam a aplicacao sem abrir um navegador real. Para JavaScript, voce precisara configurar um driver como Selenium.

## Regra pratica

Capybara deve verificar comportamento observavel. Evite selecionar elementos por classes CSS internas; prefira labels, texto de botao, roles e conteudo.

Prefira:

```ruby
fill_in "Jogador", with: "Ana"
click_button "Salvar"
expect(page).to have_content("Pontuacao salva")
```

Evite:

```ruby
find(".btn-primary").click
expect(page).to have_css(".flash-success")
```

O primeiro exemplo continua legivel quando o HTML muda. O segundo quebra com refatoracao visual.

## Exercicios

1. Crie uma pagina com formulario de pontuacao.
2. Teste validacao quando nome vier vazio.
3. Teste ordenacao visivel do ranking.
4. Teste navegacao entre cadastro e ranking.
