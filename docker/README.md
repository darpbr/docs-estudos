<h4 align="center"> 
    :construction:  Projeto em construção  :construction:
</h4>

# Comandos

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
docker attach nginx
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

## Networks
```
docker network
docker network ls
docker network prume
docker network inspect bridge
docker network create --driver bridge minharede
docker run -d -it --name ubuntu1 --network minharede bash
docker network connect minharede ubuntu3
docker run --rm -d --name nginx --network host nginx (com este comando é possível conectar ao nginx pelo localhost na porta 80 sem a necessidade do mapeamento de portas)
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
saída no terminal: - Diego
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

## Network

Tipos:
* bridge -> Mais utilizado. Quando subimos um container sem setar uma rede, a bridge é a rede padrão que vai subir no container.
* host -> conecta o container na mesma rede do host;
* overlay ->
* macvlan ->
* none -> Quando queremos subir nosso container sem especificar nenhuma rede.

### Container acessando host

Um container consegue acessar o host quando estiver na rede **host**. Basta acessar o container com o comando docker run ou docker exec, rodar o comando dentro do container: `curl http://host.docker.internal:8000` onde 8000 é o número da porta que está exposta no host.

### Docker Compose

```
docker-compose up
docker-compose up -d
docker-compose up -d --build
docker-compose ps
docker-compose down
```
