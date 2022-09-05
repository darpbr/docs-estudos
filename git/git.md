# Assuntos Relacionados ao Git GitHub


## Assinando commits com GPG Key

Consulte [aqui](https://docs.github.com/en/authentication/managing-commit-signature-verification/about-commit-signature-verification) a página do GitHub sobre **Assinatura de Commits**

Passos e comandos para configurar uma chave GPG Key e configurar no GitHub
<h4 align="rigth">
    :warning: Obs.:

</h4>
Os comandos a seguir foram rodados no Ubuntu 20.04 assim como no Windows, utilizando para isto o Terminal com WSL 2 e o SO Ubuntu 20.04.

1. Verificar se já existe uma chave GPG:
```
gpg --list-secret-keys --keyid-format=long
```
Caso não exista um par de chaves GPG basta seguir o fluxo para criação das chaves.
Caso já exista um par de chaves cadastradas, pular para o passo: Adicionar chave GPG na sua conta GitHub.
Caso já possua um par de chaves GPG e queira criar novas, basta seguir o fluxo.

2. Gerando uma nova chave GPG

Efetue o Donwload e instale o [GPG Command Line Tools](https://www.gnupg.org/download/)

Em nosso tutorial iremos utilizar um par de chaves GPG com algoritmo RSA.
Se estiver usando a versão 2.1.17 ou maior do gpg rode o comando a seguir:
```
gpg --full-generate-key
```
Se estiver usando uma versão inferior rode o comando a seguir:
```
gpg --default-new-key-algo rsa4096 --gen-key
```
* se sua versão for anterior a 2.1.17, basta pular para o passo 6

Ao rodar o comando acima (versão 2.1.17) basta esolher o Algoritmo RSA, opção 1 na lista de opções, ou basta pressionar **Enter** para opção Default.

3. Informe o tamanho da chave que você deseja utilizar, recomendamos 4096.

4. Informe o tempo em que sua chave vai expirar dentre as opções a seguir:
* 0 = não expira
* n = chave expira em n **dias**
* n(w) = chave expira em n **semanas**
* n(m) = chave expira em n **meses**
* n(y) = chave expira em n **anos**

:warning: Substituir **n** pela quantidade desejada: 1, 1w, 1m ou 1y.

5. Verifique se foi informada a data de expiração correta e confirme se estiver tudo certo.

7. Informe seu nome de usuário utilizado no GitHub

8. Informe seu e-mail utilizado para acessar o GitHub
* Será solicitado um comentário, não precisa informar.
* Confira os dados e digite uma das opções de alteração das informações ou **O** para confirmar.

9. Caso queira, informa uma passphrase de segurança. Todo commit que realizar irá solicitar essa passphrase.

10. Rode o comando a seguir para listar a forma completa de sua chave criada. A chave privada é a que será utilizada para assinar seus commits. A chave publica deverá ser cadastrada no GitHub.
```
gpg --list-secret-keys --keyid-format=long
```
Como resultado deve ser exibida uma tela parecida com a tela abaixo:
```
/Users/seu-nome/.gnupg/secring.gpg
------------------------------------
sec   4096R/<em>3AA5C34371567BD2</em> 2016-03-10 [expires: 2017-03-10]
uid                          seu-nome <seu-email@example.com>
ssb   4096R/42B317FD4BA89E7A 2016-03-10
```
Na linha: sec   4096R/**3AA5C34371567BD2** 2016-03-10 [expires: 2017-03-10] a parte destacada refere-se ao ID da sua chave publica. Para visualizar a chave basta rodar o comando a seguir substituindo pelo ID da sua chave
```
gpg --armor --export ID_CHAVE
```
Será exibida sua chave publica. Copie a partir de -----BEGIN PGP PUBLIC KEY BLOCK----- até -----END PGP PUBLIC KEY BLOCK----- inclusive.

Acesse seu GitHub, clique no ícone com seu avatar, selecione a opção settings. No menu ao lado esquerdo selecione a opção **SSH and GPG Keys**. Clique em **New GPG Key**, adicione um titulo e cole a chave publica copiada anteriormente.

Feito isto, você precisa agora "Avisar" ao Git sobre sua GPG Key.

Rode o comando a seguir para configurar o git:
```
git config --global user.signingkey 3AA5C34371567BD2
```
:warning: note que o ID informado é o mesmo consultado no passo anterior.

Após isto é necessário adicionar sua GPG Key ao .bashrc, basta rodar o comando a seguir:
```
echo 'export GPG_TTY=$(tty)' >> ~/.bashrc
echo 'export GPG_TTY=$(tty)' >> ~/.profile
```

Para assinar commits manualmente devemos rodar o comando: 
```
git commit -S -m "mensagem"
```

Agora é só commitar o código e subir o push que já será possível ver a informação de **Verified** nos seus commits.

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