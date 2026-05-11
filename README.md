# Aprenda Ruby com TDD

Um guia de estudo para aprender Ruby escrevendo testes com RSpec, inspirado na progressao didatica de "Aprenda Go com Testes": cada capitulo apresenta um conceito pequeno, escreve um teste primeiro, implementa o minimo necessario e refatora com seguranca.

Depois dos fundamentos, o guia avanca para uma aplicacao Rack pequena, chega em testes de interface com Capybara e fecha mostrando como levar os mesmos habitos para Rails com RSpec, request specs e system specs.

## Para quem e este guia

- Pessoas que ja programam e querem aprender Ruby com pratica.
- Pessoas que conhecem Ruby, mas querem usar TDD com RSpec de forma consistente.
- Times que querem estudar em grupo, com capitulos curtos e exercicios objetivos.

## Como estudar

1. Leia o objetivo do capitulo.
2. Escreva o teste antes da implementacao.
3. Rode `bundle exec rspec`.
4. Faca o teste passar com a menor solucao razoavel.
5. Refatore mantendo os testes verdes.
6. Resolva os exercicios sem olhar uma solucao pronta.

O formato de cada capitulo e propositalmente simples:

- um objetivo pequeno;
- um teste que descreve comportamento;
- uma implementacao minima;
- uma explicacao do conceito Ruby envolvido;
- exercicios para praticar sem pular etapas.

## Preparando o ambiente

Instale Ruby 3.2+ e Bundler. Depois:

```bash
bundle install
bundle exec rspec
```

Neste ambiente de trabalho atual, `ruby` e `bundle` ainda nao estao instalados, entao os comandos acima devem ser executados em uma maquina com Ruby configurado.

## Indice do livro

### Primeiros passos com Ruby e RSpec

1. [Instalacao e ciclo TDD](docs/00-instalacao-e-ciclo-tdd.md)
2. [Ola, mundo](docs/01-ola-mundo.md)
3. [Numeros e documentacao viva](docs/02-numeros.md)
4. [Iteracao e benchmarks](docs/03-iteracao.md)
5. [Arrays, ranges e enumerables](docs/04-arrays-e-enumerables.md)
6. [Objetos, modulos e contratos](docs/05-objetos-modulos-e-contratos.md)
7. [Hashes, simbolos e valores opcionais](docs/06-hashes-simbolos-e-nil.md)
8. [Erros, excecoes e resultados explicitos](docs/07-erros-e-resultados.md)
9. [Injecao de dependencia e I/O](docs/08-injecao-de-dependencia.md)
10. [Mocks, spies e doubles](docs/09-mocks-spies-e-doubles.md)
11. [Concorrencia Ruby](docs/10-concorrencia.md)
12. [Metaprogramacao com cuidado](docs/11-metaprogramacao.md)

### Criando uma aplicacao

13. [Aplicacao Rack testada](docs/12-aplicacao-rack.md)
14. [JSON, rotas e persistencia simples](docs/13-json-rotas-e-persistencia.md)
15. [Linha de comando e estrutura do projeto](docs/14-cli-e-estrutura.md)
16. [Tempo, jobs e tarefas periodicas](docs/15-tempo-e-jobs.md)
17. [WebSockets e eventos](docs/16-websockets-e-eventos.md)

### Capybara e Rails

18. [Capybara: testes pelo comportamento do usuario](docs/17-capybara.md)
19. [Puxando para Rails](docs/18-rails.md)

### Meta

20. [Referencias](docs/19-referencias.md)
21. [Publicacao no GitBook](docs/20-publicacao-gitbook.md)

## Particularidades do Ruby que o guia enfatiza

- Tudo e objeto, inclusive numeros, `nil`, classes e modulos.
- Blocos sao parte central da linguagem.
- Duck typing troca interfaces formais por contratos comportamentais.
- Mutabilidade e efeitos colaterais precisam ser tratados com disciplina.
- Excecoes existem, mas nem todo erro de dominio precisa ser excecao.
- Metaprogramacao e poderosa, mas deve aparecer depois de testes claros.

## Exemplos inclusos

Os arquivos em `lib/` e `spec/` acompanham os primeiros capitulos. Eles servem como ponto de partida para os exercicios:

- `lib/greeter.rb` e `spec/greeter_spec.rb`
- `lib/calculator.rb` e `spec/calculator_spec.rb`
- `lib/repeater.rb` e `spec/repeater_spec.rb`
- `lib/wallet.rb` e `spec/wallet_spec.rb`
- `lib/countdown.rb` e `spec/countdown_spec.rb`

## Licenca e credito

Este projeto e um material original em portugues para Ruby, RSpec, Capybara e Rails. Ele usa a ideia pedagogica de aprender uma linguagem por testes e segue uma ordem de assuntos parecida com a referencia publica "Aprenda Go com Testes", sem reproduzir seus textos.

As referencias principais estao reunidas em [Referencias](docs/19-referencias.md).
