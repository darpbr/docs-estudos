# Alguns comandos

## consultas
```
docker ps
docker ps -a
docker ps -a -q
docker images
docker images -a
```
## Subindo um container
```
docker run nginx
docker run -it nginx
docker run -d nginx
docker run -d nginx --name nginx -p 8080:80 nginx
docker run --name nginx -it nginx bash
docker run --rm darpbr/nginx-com-vim
```

## Executando/parando um container
```
docker exec nginx
docker exec -it nginx bash
docker stop nginx
```

## Removendo containers
```
docker rm nginx
docker rm nginx -f
docker rm $(docker ps -a -q) -f
```

## Removendo Imagens
```
docker rmi nginx
docker rmi $(docker ps -a -q) -f
```

## DockerFile

Arquivo de configuração do nosso container, é a "receita de bolo", um dos principais arquivos.

* ENV VARIAVEIS VALORES -> declaração de variáveis
* * Utilização das variáveis passadas -> ${VARIAVEIS}
* RUN -> executa os comandos passados na criação do container
* WORKDIR /app -> diretório que será iniciado no container
* COPY html/ /usr/shared/nginx/html -> copia os arquivos locais para a pasta /usr/.../html do container
* ENTRYPOINT ["echo","Hello"] -> comando fixo, não é alterado na passagem de parâmetros durante uma chamada docker run
* EXPOSE 80 -> Deixa a porta 80 do container exposta por padrão
* CMD ["echo","Hello World"] -> pode ser alterado com parâmetros passados na chamada do método docker run
```
docker run darpbr/hello Diego
- Diego
```

## Construindo uma imagem
Após configurar o Dockerfile, acessar a pasta onde o arquivo foi criado e rodar o comando a seguir
```
docker build -t darpbr/nginx-com-vim:latest .
```

## Publicando imagem no DockerHub
1. Realizar o Login no Dockerhub via terminal
```
docker login
```
2. Rodar o comando push
```
docker push darpbr/nginx-diego
```