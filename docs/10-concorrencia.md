# Concorrencia Ruby

## Objetivo

Entender threads, filas e sincronizacao basica.

## Conceitos

- `Thread` executa trabalho concorrente.
- `Queue` ajuda a comunicar resultados entre threads.
- `Mutex` protege estado compartilhado.

## Exemplo

```ruby
queue = Queue.new

Thread.new { queue << expensive_call }

result = queue.pop
```

## Particularidade Ruby

Em CRuby existe GVL, entao threads ajudam muito com I/O, mas nem sempre aceleram CPU pesada. Para processos Rails, isso ainda importa: chamadas HTTP, banco e arquivos podem se beneficiar de concorrencia controlada.

## Exercicios

1. Busque tres URLs usando threads e compare com versao sequencial.
2. Use `Queue` para coletar resultados.
3. Proteja um contador compartilhado com `Mutex`.
