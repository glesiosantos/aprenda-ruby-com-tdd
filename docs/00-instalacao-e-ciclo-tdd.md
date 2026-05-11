# Instalacao e ciclo TDD

## Objetivo

Preparar o ambiente e entender o ritmo que sera usado em todo o guia.

## Ferramentas

- Ruby 3.2 ou superior.
- Bundler.
- RSpec.
- Um editor com formatacao e terminal integrado.

## Instalacao do RSpec

Comece em uma pasta vazia para o projeto:

```bash
mkdir aprenda-ruby-com-tdd
cd aprenda-ruby-com-tdd
bundle init
```

O comando `bundle init` cria um `Gemfile`. Edite esse arquivo para declarar a versao de Ruby e a gem do RSpec:

```ruby
source "https://rubygems.org"

ruby ">= 3.2"

gem "rspec", "~> 3.13"
```

Depois instale as dependencias:

```bash
bundle install
```

Agora inicialize a estrutura do RSpec:

```bash
bundle exec rspec --init
```

Esse comando cria dois arquivos:

```text
.
├── .rspec
└── spec/
    └── spec_helper.rb
```

Use `.rspec` para configurar como a saida dos testes aparece no terminal:

```text
--format documentation
--color
```

Use `spec/spec_helper.rb` para a configuracao comum dos testes:

```ruby
RSpec.configure do |config|
  config.example_status_persistence_file_path = ".rspec_status"
  config.disable_monkey_patching!
  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
  end
end
```

Essa configuracao mantem os exemplos mais explicitos: usamos `RSpec.describe` em vez de `describe` global e `expect(...)` como sintaxe de expectativa.

## Ciclo

1. Vermelho: escreva um teste que falha por um motivo claro.
2. Verde: implemente o minimo necessario para passar.
3. Refatoracao: melhore nomes, estrutura e duplicacoes sem mudar comportamento.

![Ciclo TDD: Vermelho, Verde e Refatoracao](images/tdd-cycle.svg)

Esse ciclo e pequeno de proposito. Quando o passo fica grande demais, voce perde a mensagem mais importante que o teste te da: "qual comportamento falta agora?".

## Comandos

```bash
bundle exec rspec
bundle exec rspec spec/greeter_spec.rb
```

Use `bundle exec` para garantir que o comando roda com as gems declaradas no `Gemfile` do projeto.

## Estrutura inicial

```text
.
├── Gemfile
├── README.md
├── SUMMARY.md
├── docs/
├── lib/
└── spec/
```

O livro fica em `README.md`, `SUMMARY.md` e `docs/`. Os exemplos executaveis ficam em `lib/` e `spec/`.

## Particularidade Ruby

Ruby favorece leitura. Um bom teste em Ruby deve parecer uma frase sobre comportamento, nao uma demonstracao de detalhes internos.

## Exercicio

Crie um arquivo `spec/smoke_spec.rb` com um teste simples:

```ruby
RSpec.describe "ambiente" do
  it "executa RSpec" do
    expect(1 + 1).to eq(2)
  end
end
```

Depois rode:

```bash
bundle exec rspec spec/smoke_spec.rb
```

Se o teste passar, o ambiente esta pronto para os proximos capitulos.
