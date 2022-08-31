# Assuntos Relacionados ao Git GitHub

<h4 align="center"> 
    :construction:  Projeto em construção  :construction:
</h4>

## Semantic Version SemVer

Recomendo a leitura da [documentação](https://semver.org/lang/pt-BR/) para entender o SemVer.


Dado um número de versão **MAJOR.MINOR.PATCH**, incremente a:

1. versão Maior(MAJOR): quando fizer mudanças incompatíveis na API;
2. versão Menor(MINOR): quando adicionar funcionalidades mantendo compatibilidade;
3. versão de Correção(PATCH): quando corrigir falhas mantendo compatibilidade (bugs, ajustes).


## Conventional Commits

[![Conventional Commits](https://img.shields.io/badge/Conventional%20Commits-1.0.0-%23FE5196?logo=conventionalcommits&logoColor=white)](https://conventionalcommits.org)

[Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/) define um conjunto de regras para criar um histórico de commit explícito, o que facilita a criação de ferramentas automatizadas baseadas na especificação. Esta convenção se encaixa com o **SemVer**, descrevendo os recursos, correções e modificações que quebram a compatibilidade nas mensagens de commit.

### Template padrão de commits
```
<tipo>[escopo opcional]: <descrição>

[corpo opcional]

[rodapé(s) opcional(is)]
```
* Tipo: -> 
* * `fix:` soluciona um problema no código (relaciona com o PATH do SemVer)
* * `feat:` inclui um novo recurso no código (relaciona com o MINOR do SemVer)
* * `BREAKING CHANGE:` um commit deste tipo contém o texto *BREAKING CHANGE* no rodapé, ou uma **!** depois do *tipo/escopo*. Introduz uma modificação que quebra a compatibilidade da API (relaciona com o MAJOR do SemVer)

Outros tipos também podem ser utilizados, como por exemplo os baseados na [Convenção Angular](https://github.com/angular/angular/blob/22b96b9/CONTRIBUTING.md#type) *build:*, *ci:*, *docs:*, *style:*, *refactor:*, *perf:*, *test:*.

* [escopo opcional] ->

* <descrião> -> Breve descrição, bem resumida;

* [corpo opcional] -> Descrição mais detalhada;

* [rodapé opcional] -> Informação de quem foi a ideia, qual Issue deu origem (Este commit resolve a Issue #123)

### Exemplos de Commits:
```
feat: permitir que o objeto de configuração fornecido estenda outras configurações

BREAKING CHANGE: a chave `extends`, no arquivo de configuração, agora é utilizada para estender outro arquivo de configuração
```
```
refactor(execução)!: remove suporte para Node 6
```
```
refactor!: remove suporte para Node 6

BREAKING CHANGE: refatorar para usar recursos do JavaScript não disponíveis no Node 6.
```
```
docs: ortografia correta de CHANGELOG
```
```
fix: corrige pequenos erros de digitação no código

veja o ticket para detalhes sobre os erros de digitação corrigidos

Revisado por: Daniel Nass
Refs #133
```

* No VSCode podemos instalar uma extensão chamada **Convencional Commits** para nos auxiliar na formatação dos nossos commits
* Pode ser usado também o [Commitizen/cz-cli](https://github.com/commitizen/cz-cli)