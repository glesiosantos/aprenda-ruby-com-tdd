# Ola, mundo

## Objetivo

Escrever o primeiro teste, criar uma funcao simples e introduzir argumentos opcionais.

## Teste primeiro

```ruby
require "spec_helper"
require_relative "../lib/greeter"

RSpec.describe Greeter do
  it "cumprimenta o mundo por padrao" do
    expect(Greeter.hello).to eq("Ola, mundo!")
  end
end
```

Antes de criar codigo de producao, rode o teste. A primeira falha deve dizer que `Greeter` ainda nao existe. Essa falha e util: ela confirma que o teste esta olhando para o lugar certo.

## Implementacao minima

Comece sem generalizar:

```ruby
class Greeter
  def self.hello
    "Ola, mundo!"
  end
end
```

Depois escreva outro teste para cumprimentar uma pessoa:

```ruby
it "cumprimenta uma pessoa pelo nome" do
  expect(Greeter.hello("Ruby")).to eq("Ola, Ruby!")
end
```

Agora sim mude a implementacao para receber argumento.

## Implementacao final do capitulo

Veja `lib/greeter.rb`. O metodo `Greeter.hello` usa argumentos padrao e keyword arguments:

```ruby
Greeter.hello("Ruby", language: :en)
```

## Conceitos

- Classes tambem sao objetos.
- Metodos de classe sao uteis para comportamentos sem estado.
- Hashes com simbolos sao comuns para configuracao pequena.
- Keyword arguments deixam chamadas com opcoes mais legiveis.

## Refatoracao guiada pelo teste

Quando o suporte a idiomas aparecer, resista a criar uma estrutura complexa cedo demais. Um hash constante e suficiente:

```ruby
MESSAGES = {
  pt: "Ola",
  en: "Hello",
  es: "Hola"
}.freeze
```

Se um dia a regra crescer para traducao completa, os testes vao proteger a mudanca.

## Exercicios

1. Adicione suporte a `:fr`.
2. Quando `name` vier vazio, trate como `"mundo"`.
3. Escreva um teste para idioma desconhecido.
