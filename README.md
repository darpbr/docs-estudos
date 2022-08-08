<h1 align="center"> Documentos Estudos DARP </h1>

<p align="left">
<img src="http://img.shields.io/static/v1?label=STATUS&message=EM%20DESENVOLVIMENTO&color=GREEN&style=for-the-badge"/>
</p>


<h2 align="left"> Descrição </h2>

Armazenar algumas dicas e informações a respeito de: Desenvolvimento de Software, DevOps, Linguagens de programação e muitos outros assuntos ligados a **TI**.

### Indice



---

<h2 align="left"> Linux </h2>

**Importante!**: Todos os comandos foram executados utilizando o S.O. Linux Ubuntu 20.04. Caso queira executar em alguma distribuição ou versão diferente os comandos podem sofrer alterações. 
## Comandos

### Grupos e Usuários
* Criando usuários:
* * -c -> permite adicionar comentário sobre o usuário (nome completo por exemplo);
* * -m -> cria a pasta do usuário no caminho /home/user
* * -s -> indica o terminal/bash padrão a ser utilizado pelo usuário
* * -p -> define uma senha para o usuário
```
useradd nome_usuario -c "nome completo" -m -s /bin/bash -p $(openssl passwd senha)
```
* Consulta de grupos:
```
cat /etc/group
```
* Adicionando grupo:
```
groupadd NOME_DO_GRUPO
```
* Removendo um grupo (caso o grupo possua algum usuário ou usuários fazendo parte é **necessário** primeiro a remoção dos usuários do grupo):
```
groupdel NOME_DO_GRUPO
```
* Adicionando usuários a um grupo no momento da criação do user:
```
useradd nome_usuario -c "nome completo" -m -s /bin/bash -p $(openssl passwd senha) -G GRUPO
```
* Adicionando usuário já existente a um grupo:
* * **Importante !**: Caso o usuário já faça parte de algum grupo e rodarmos o comando a seguir indicando apenas um grupo novo, o usuário vai ser removido dos grupos no qual fazia parte e será adicionado apenas ao grupo(s) informado(s). Portanto caso queira que o usuário permaneça nos grupos no qual já faça parte deverá ser informado todos os grupos separados por *,*.
```
usermod -G NOME_GRUPO,NOME_DE_OUTRO_GRUPO usuario
```
* Removendo usuário de um grupo:
* * Remoção do usuário apenas do grupo especificado
```
gpasswd -d usuario NOME_GRUPO
```

### Permissões
```
r - read
w - escrita
x - execução
```
Ao rodar o comando `ls -l` podemos consultar as permissões e informações de um arquivo/diretório. Deverá apresentar da seguinte forma:
drwxrwxrwx usuario grupo ... ... nome_diretorio
-rwxrwxrwx usuario grupo ... ... nome_arquivo

* O primeiro campo **d** indica que a informação refere-se a um diretório, caso apareça **-** temos a indicação de que se trata de um arquivo.
* Os próximos tres campos indicam as permissões do dono do arquivo (normalmente aparecem as permissçoes todas de leitura, escrita e execução - **rwx**) mas, podem aparecer também das seguintes formas:
* * r-- -> indica apenas leitura
* * -w- -> indica apenas escrita
* * --x -> indica apenas execução
* * rw- -> Leitura e escrita
* * r-x -> Leitura e execução
* * -wx > Escrita e execução

* Trabalhando permissão com números:
* * R - 4
* * W - 2
* * X - 1
* * Nenhuma - 0

Ou seja, para que um diretório, arquivo possua acesso total por qualquer usuário deverá ser concedida premissão 777 (R+W+X = 4+2+1)onde cada número representa a permissão a: dono, grupo, demais usuários.

Podemos conceder acesso a pasta/arquivo com o seguinte comando:
```
chmod 777 /adm/
```
ou
```
chmod 750 /adm/relatorio.txt
```

### Alterar dono de um arquivo/diretório
* Precisamos estar logado como root e rodar o seguinte comando:
```
chown new_user:new_group arquivo/diretorio
```
