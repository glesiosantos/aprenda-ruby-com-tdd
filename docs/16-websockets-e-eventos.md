# WebSockets e eventos

## Objetivo

Entender comunicacao em tempo real como evolucao de eventos de dominio.

## Abordagem

Antes de testar WebSocket diretamente, teste o publicador de eventos:

```ruby
publisher.publish(:score_created, player: "ana", score: 10)
```

Depois conecte esse publicador ao servidor WebSocket.

## Exercicios

1. Crie um objeto `EventBus` em memoria.
2. Teste inscricao e publicacao.
3. Use o evento `score_created` para notificar clientes conectados.
