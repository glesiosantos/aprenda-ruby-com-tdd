# Metaprogramacao com cuidado

## Objetivo

Conhecer reflexao e metaprogramacao sem transformar testes em adivinhacao.

## Ferramentas

```ruby
object.respond_to?(:call)
object.public_methods
klass.define_method(:name) { "Ruby" }
```

## Quando usar

- Criar DSLs pequenas e legiveis.
- Remover repeticao estrutural real.
- Integrar com frameworks que ja usam esse estilo.

## Quando evitar

- Para economizar poucas linhas.
- Quando o erro fica dificil de rastrear.
- Quando um metodo normal resolveria.

## Exercicios

1. Crie um validador que declara campos obrigatorios.
2. Teste mensagens de erro antes de implementar a DSL.
3. Refatore para metaprogramacao apenas depois de ter testes claros.
