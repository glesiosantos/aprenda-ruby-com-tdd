# Ola, mundo

## Objetivo

Escrever o primeiro teste, criar uma funcao simples e introduzir argumentos opcionais.

## Teste primeiro

Neste capitulo vamos montar a bateria de testes em tres passos pequenos:

1. Quando ninguem informa um nome, cumprimentamos o mundo.
2. Quando a pessoa informa um nome, cumprimentamos essa pessoa.
3. Quando a pessoa informa um idioma, usamos a saudacao desse idioma.

Cada passo segue o mesmo ciclo:

1. Escrever um teste pequeno que descreve o comportamento desejado.
2. Rodar o teste e ler a falha.
3. Implementar apenas o necessario para passar.
4. Rodar o teste novamente.
5. Refatorar somente quando existir teste cobrindo o comportamento.

## Passo 1: quando ninguem informa um nome

Comece pelo comportamento mais trivial. Se ninguem for informado, o metodo deve retornar uma saudacao para o mundo:

```ruby
require "spec_helper"
require_relative "../lib/greeter"

RSpec.describe Greeter do
  describe ".hello" do
    context "without arguments" do
      it "greets the world" do
        expect(described_class.hello).to eq("Ola, mundo!")
      end
    end
  end
end
```

Antes de criar codigo de producao, rode o teste:

```bash
bundle exec rspec spec/greeter_spec.rb
```

A primeira falha deve apontar que `lib/greeter.rb` ainda nao foi encontrado. Essa falha e util: ela confirma que o teste esta olhando para o lugar certo.

Crie entao `lib/greeter.rb` com uma classe vazia:

```ruby
class Greeter
end
```

Rode o teste de novo. Agora a falha deve mudar: o arquivo existe, a classe existe, mas `Greeter` ainda nao responde a `hello`. Essa mudanca na falha mostra que voce avancou um passo.

## Implementacao minima

Agora faca apenas o suficiente para o teste passar. Nao adicione parametro, idioma, hash ou configuracao. O comportamento pedido pelo teste e fixo, entao o codigo tambem pode ser fixo:

```ruby
class Greeter
  def self.hello
    "Ola, mundo!"
  end
end
```

Rode novamente:

```bash
bundle exec rspec spec/greeter_spec.rb
```

O teste deve passar. Neste momento o codigo esta simples, mas ainda nao e flexivel. Tudo bem: em TDD, primeiro colocamos um comportamento sob teste, depois deixamos o proprio teste pedir a proxima mudanca.

## Passo 2: quando a pessoa informa o seu nome

Agora escreva outro teste. Ele descreve uma nova regra: se a pessoa informar um nome, esse nome aparece na mensagem.

```ruby
context "with a name" do
  it "greets the person" do
    expect(described_class.hello("Ruby")).to eq("Ola, Ruby!")
  end
end
```

Rode os testes:

```bash
bundle exec rspec spec/greeter_spec.rb
```

O primeiro teste deve continuar passando. O novo deve falhar porque `hello` ainda nao aceita argumento. Essa combinacao e importante: o teste antigo protege o comportamento existente, enquanto o teste novo guia a proxima mudanca.

Agora sim mude a implementacao para receber um nome. Use um valor padrao para manter o primeiro teste funcionando:

```ruby
class Greeter
  def self.hello(name = "mundo")
    "Ola, #{name}!"
  end
end
```

Rode de novo. Os dois testes devem ficar verdes.

Aqui aparece a primeira pequena refatoracao. Antes a string era fixa:

```ruby
"Ola, mundo!"
```

Agora a parte variavel e apenas o nome:

```ruby
"Ola, #{name}!"
```

O valor padrao `"mundo"` preserva o comportamento anterior. Isso e importante: o teste novo forcou uma mudanca, e o teste antigo garante que nao quebramos o caso sem argumentos.

## Passo 3: quando a pessoa informa o idioma

Com os dois primeiros comportamentos protegidos, podemos adicionar idioma. Comece com apenas um idioma extra:

```ruby
context "with another language" do
  it "uses that language" do
    expect(described_class.hello("Ruby", language: :en)).to eq("Hello, Ruby!")
  end
end
```

Esse teste introduz uma keyword argument: `language: :en`. Ela deixa claro que `:en` nao e outro nome, mas uma opcao de idioma.

Rode os testes:

```bash
bundle exec rspec spec/greeter_spec.rb
```

Os dois primeiros testes devem continuar passando. O novo teste deve falhar porque o metodo ainda nao conhece `language`.

## Implementacao trivial para idioma

O primeiro codigo que passa pode ser bem direto:

```ruby
class Greeter
  def self.hello(name = "mundo", language: :pt)
    greeting = language == :en ? "Hello" : "Ola"

    "#{greeting}, #{name}!"
  end
end
```

Isso resolve os tres testes:

- Sem argumentos: `name` usa `"mundo"` e `language` usa `:pt`.
- Com nome: `name` recebe `"Ruby"` e `language` continua `:pt`.
- Com idioma: `language` recebe `:en` e troca a saudacao para `"Hello"`.

Rode novamente. Os tres testes devem ficar verdes.

Ainda nao precisamos criar uma solucao grande. O teste pediu suporte a um idioma extra, entao um condicional pequeno e suficiente para seguir.

## Refatorando para uma estrutura simples

Depois que os testes estao verdes, podemos melhorar a forma sem mudar o comportamento. O condicional funciona, mas tende a crescer mal se novos idiomas aparecerem:

```ruby
greeting = language == :en ? "Hello" : "Ola"
```

Uma pequena tabela de mensagens deixa a intencao mais clara:

```ruby
class Greeter
  DEFAULT_LANGUAGE = :pt

  MESSAGES = {
    pt: "Ola",
    en: "Hello",
    es: "Hola"
  }.freeze

  def self.hello(name = "mundo", language: DEFAULT_LANGUAGE)
    greeting = MESSAGES.fetch(language) { MESSAGES.fetch(DEFAULT_LANGUAGE) }
    "#{greeting}, #{name}!"
  end
end
```

O comportamento continua o mesmo, mas a regra de saudacoes ficou concentrada em `MESSAGES`.

`fetch` tambem deixa explicito o que acontece quando um idioma nao existe: usamos o idioma padrao. Esse detalhe pode virar um teste proprio em um exercicio.

## Bateria final de testes

Ao final do capitulo, `spec/greeter_spec.rb` deve documentar os tres comportamentos principais:

```ruby
require "spec_helper"
require_relative "../lib/greeter"

RSpec.describe Greeter do
  describe ".hello" do
    context "without arguments" do
      it "greets the world" do
        expect(described_class.hello).to eq("Ola, mundo!")
      end
    end

    context "with a name" do
      it "greets the person" do
        expect(described_class.hello("Ruby")).to eq("Ola, Ruby!")
      end
    end

    context "with another language" do
      it "uses that language" do
        expect(described_class.hello("Ruby", language: :en)).to eq("Hello, Ruby!")
      end
    end
  end
end
```

Essa bateria e pequena de proposito. Ela cobre o caminho do aprendizado:

- primeiro, nenhuma entrada;
- depois, um argumento simples;
- por fim, uma opcao nomeada.

## Implementacao final do capitulo

Veja `lib/greeter.rb`. A implementacao final do capitulo usa argumentos padrao, keyword arguments e uma tabela pequena de mensagens:

```ruby
class Greeter
  DEFAULT_LANGUAGE = :pt

  MESSAGES = {
    pt: "Ola",
    en: "Hello",
    es: "Hola"
  }.freeze

  def self.hello(name = "mundo", language: DEFAULT_LANGUAGE)
    greeting = MESSAGES.fetch(language) { MESSAGES.fetch(DEFAULT_LANGUAGE) }
    "#{greeting}, #{name}!"
  end
end
```

## Conceitos

- Classes tambem sao objetos.
- Metodos de classe sao uteis para comportamentos sem estado.
- Hashes com simbolos sao comuns para configuracao pequena.
- Keyword arguments deixam chamadas com opcoes mais legiveis.

## Exercicios

1. Adicione suporte a `:fr`.
2. Quando `name` vier vazio, trate como `"mundo"`.
3. Escreva um teste para idioma desconhecido.
