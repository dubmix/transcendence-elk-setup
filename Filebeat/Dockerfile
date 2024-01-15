FROM debian:latest

RUN apt-get update
RUN apt-get install -y wget
RUN apt-get install -y gpg

RUN wget -qO- https://artifacts.elastic.co/GPG-KEY-elasticsearch | gpg --dearmor -o /usr/share/keyrings/elasticsearch-keyring.gpg

RUN echo "deb [signed-by=/usr/share/keyrings/elasticsearch-keyring.gpg] https://artifacts.elastic.co/packages/8.x/apt stable main" | tee /etc/apt/sources.list.d/elastic-8.x.list

RUN apt-get update
RUN apt-get install -y filebeat

ENV PATH=/usr/share/filebeat/bin:$PATH

COPY filebeat.yml /etc/filebeat/filebeat.yml

RUN mkdir /logs

RUN mkdir /etc/filebeat/ssl

CMD ["filebeat", "-e", "-c", "/etc/filebeat/filebeat.yml"]

#CMD ["tail", "-f", "/dev/null"]
