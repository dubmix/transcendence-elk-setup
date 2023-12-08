FROM debian:latest

RUN apt-get update
RUN apt-get install -y wget
RUN apt-get install -y gpg

RUN wget -qO- https://artifacts.elastic.co/GPG-KEY-elasticsearch | gpg --dearmor -o /usr/share/keyrings/elasticsearch-keyring.gpg

RUN apt-get install apt-transport-https

RUN echo "deb [signed-by=/usr/share/keyrings/elasticsearch-keyring.gpg] https://artifacts.elastic.co/packages/8.x/apt stable main" | tee /etc/apt/sources.list.d/elastic-8.x.list

RUN echo 'root:1234' | chpasswd

RUN mkdir -p /usr/share/elasticsearch

RUN apt-get update
RUN apt-get install elasticsearch

WORKDIR /usr/share/elasticsearch/bin

RUN ./elasticsearch-users useradd team -p 42berlin -r superuser

RUN chown -R elasticsearch:elasticsearch /usr/share/elasticsearch
RUN usermod -d /usr/share/elasticsearch elasticsearch
RUN usermod -s /bin/bash elasticsearch

COPY elasticsearch.yml /etc/elasticsearch/elasticsearch.yml
RUN chmod 777 /etc/elasticsearch/elasticsearch.yml

USER elasticsearch
ENV PATH=/usr/share/elasticsearch/bin:$PATH

EXPOSE 9200

CMD ["elasticsearch"]

#CMD ["tail", "-f", "/dev/null"]
#user: team, pw:42berlin
