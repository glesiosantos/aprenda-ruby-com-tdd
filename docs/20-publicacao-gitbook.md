# Publicacao no GitBook

## Objetivo

Publicar este repositorio como um livro navegavel, mantendo o conteudo versionado em Git.

## Arquivos importantes

- `README.md`: pagina inicial do livro.
- `SUMMARY.md`: sumario usado pelo GitBook para montar a navegacao.
- `docs/`: capitulos do livro.
- `lib/` e `spec/`: exemplos executaveis usados pelos capitulos.

## Fluxo recomendado

1. Crie um repositorio no GitHub.
2. Envie estes arquivos para a branch principal.
3. No GitBook, crie um novo space.
4. Conecte o space ao repositorio GitHub.
5. Configure `README.md` como pagina inicial.
6. Confira se o `SUMMARY.md` aparece como navegacao.

## Convencao para novos capitulos

Use nomes numerados para preservar a ordem:

```text
docs/21-nome-do-capitulo.md
docs/22-outro-assunto.md
```

Depois adicione o link em `SUMMARY.md` e no indice do `README.md`.

## Modelo de capitulo

```markdown
# Titulo do capitulo

## Objetivo

Uma frase sobre o comportamento que vamos aprender.

## Teste primeiro

Codigo RSpec que falha por um motivo claro.

## Implementacao

Codigo minimo para passar.

## Refatoracao

Melhoria feita depois do teste verde.

## Conceitos

Explicacao curta do Ruby envolvido.

## Exercicios

1. Um exercicio pequeno.
2. Uma variacao.
3. Um desafio incremental.
```

## Regra editorial

Cada capitulo deve ensinar uma coisa principal. Se o capitulo precisar explicar Ruby, RSpec, arquitetura e Rails ao mesmo tempo, divida em capitulos menores.

## Checklist antes de publicar

1. `SUMMARY.md` aponta para todos os capitulos.
2. Links internos funcionam.
3. Exemplos de codigo usam nomes consistentes.
4. Referencias novas foram adicionadas em `docs/19-referencias.md`.
5. `bundle exec rspec` passa em uma maquina com Ruby instalado.
