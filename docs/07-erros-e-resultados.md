# Erros, excecoes e resultados explicitos

## Objetivo

Decidir quando usar excecao e quando retornar um resultado de dominio.

## Excecao

Use excecao para uso invalido da API:

```ruby
expect { wallet.deposit(-1) }.to raise_error(ArgumentError)
```

## Resultado explicito

Use retorno para uma negativa esperada do negocio:

```ruby
expect(wallet.withdraw(100)).to be(false)
```

## Regra pratica

- Programador chamou errado: excecao.
- Usuario ou regra de negocio recusou: resultado explicito.
- Falha externa imprevisivel: excecao capturada na borda do sistema.

## Exercicios

1. Troque `withdraw` para retornar um objeto `Result`.
2. Teste `success?`, `failure?` e `message`.
3. Garanta que saldo nao muda em falha.
