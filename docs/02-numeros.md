# Numeros e documentacao viva

## Objetivo

Usar testes pequenos para documentar operacoes numericas e nomes de metodos.

## Teste primeiro

Neste capitulo vamos construir uma calculadora pequena em dois passos:

1. Somar dois numeros.
2. Multiplicar dois numeros.

Cada passo deve ser feito do mesmo jeito usado no capitulo anterior:

1. Escrever um teste que descreve o comportamento desejado.
2. Rodar o teste e ler a falha.
3. Implementar apenas o necessario para passar.
4. Rodar o teste novamente.
5. Refatorar somente se houver algo real para melhorar.

## Passo 1: soma

Comece criando `spec/calculator_spec.rb`. O primeiro teste deve falar sobre comportamento, nao sobre a implementacao interna:

```ruby
require "spec_helper"
require_relative "../lib/calculator"

RSpec.describe Calculator do
  subject(:calculator) { described_class.new }

  describe "#add" do
    it "soma dois numeros" do
      expect(calculator.add(2, 3)).to eq(5)
    end
  end
end
```

Leia esse teste de fora para dentro:

- `RSpec.describe Calculator` diz qual classe esta sendo especificada.
- `subject(:calculator)` cria uma instancia para os exemplos.
- `describe "#add"` agrupa exemplos do metodo de instancia `add`.
- `it "soma dois numeros"` descreve o comportamento esperado.
- `expect(calculator.add(2, 3)).to eq(5)` executa o codigo e compara o resultado.

Agora rode somente esse arquivo:

```bash
bundle exec rspec spec/calculator_spec.rb
```

Se `lib/calculator.rb` ainda nao existir, a falha deve apontar que o arquivo nao foi encontrado. Essa e a primeira informacao util: o teste ja sabe onde espera encontrar o codigo de producao.

Crie entao `lib/calculator.rb` com uma classe vazia:

```ruby
class Calculator
end
```

Rode o teste de novo. Agora a falha deve mudar: o arquivo existe, a classe existe, mas o objeto ainda nao responde a `add`. Essa mudanca na falha mostra que voce avancou um passo.

Implemente apenas o metodo pedido pelo teste:

```ruby
class Calculator
  def add(left, right)
    left + right
  end
end
```

Rode novamente:

```bash
bundle exec rspec spec/calculator_spec.rb
```

O teste deve passar. Neste ponto, nao ha refatoracao necessaria: o nome do metodo esta claro, os parametros estao claros e a implementacao e direta.

## Passo 2: multiplicacao

Com a soma protegida por teste, adicione um segundo comportamento no mesmo arquivo:

```ruby
describe "#multiply" do
  it "multiplica dois numeros" do
    expect(calculator.multiply(4, 5)).to eq(20)
  end
end
```

Rode os testes:

```bash
bundle exec rspec spec/calculator_spec.rb
```

O teste de soma deve continuar passando. O novo teste deve falhar porque `Calculator` ainda nao tem `multiply`. Essa combinacao e importante: o teste antigo protege o comportamento existente, enquanto o teste novo guia a proxima mudanca.

Agora implemente a multiplicacao:

```ruby
class Calculator
  def add(left, right)
    left + right
  end

  def multiply(left, right)
    left * right
  end
end
```

Rode de novo. Os dois testes devem ficar verdes.

## Bateria final de testes

`lib/calculator.rb` contem `add` e `multiply`.

```ruby
require "spec_helper"
require_relative "../lib/calculator"

RSpec.describe Calculator do
  subject(:calculator) { described_class.new }

  describe "#add" do
    it "soma dois numeros" do
      expect(calculator.add(2, 3)).to eq(5)
    end
  end

  describe "#multiply" do
    it "multiplica dois numeros" do
      expect(calculator.multiply(4, 5)).to eq(20)
    end
  end
end
```

Essa bateria funciona como documentacao viva: se alguem mudar `Calculator` e quebrar soma ou multiplicacao, o teste mostra o problema imediatamente.

## Particularidade Ruby

Numeros sao objetos:

```ruby
3.odd?
10.times { puts "Ruby" }
```

Isso torna a linguagem expressiva, mas nao substitui bons nomes de dominio. `wallet.deposit(10)` comunica melhor do que `balance += 10` espalhado pelo sistema.

## Exercicios

1. Adicione `subtract`.
2. Adicione `divide` e teste divisao por zero.
3. Crie exemplos com inteiros e decimais usando `BigDecimal`.
