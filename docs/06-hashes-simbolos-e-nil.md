# Hashes, simbolos e valores opcionais

## Objetivo

Usar `Hash` para dados chave-valor e lidar com ausencia de valor.

## Exemplo

```ruby
prices = { "apple" => 3, "banana" => 2 }
prices.fetch("apple")
```

Prefira `fetch` quando ausencia for erro ou precisar de padrao explicito:

```ruby
prices.fetch("orange", 0)
```

## Simbolos

Simbolos sao comuns para chaves internas e opcoes:

```ruby
user = { name: "Ana", role: :admin }
```

## Nil

`nil` tambem e objeto, mas pode esconder erro de modelagem. Em codigo de dominio, teste casos sem valor com clareza:

```ruby
expect(repository.find("missing")).to be_nil
```

## Exercicios

1. Crie um dicionario de estoque.
2. Atualize quantidade de um item.
3. Retorne erro quando o item nao existir usando `fetch`.
