#FROM ubuntu:latest
FROM nginx:latest

COPY html/ /usr/share/nginx/html

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["nginx", "-g", "daemon off;"]

#USER darp

#ENTRYPOINT ["echo", "Hello"]

#CMD ["World"]

#CMD ["echo","Hello World"]

#WORKDIR /app

#RUN apt-get update && \
#    apt-get install vim -y

#COPY html/ /usr/share/nginx/html