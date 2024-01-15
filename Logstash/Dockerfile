FROM debian:latest

RUN apt-get update
RUN apt-get install -y wget
RUN apt-get install -y gpg

RUN wget -qO- https://artifacts.elastic.co/GPG-KEY-elasticsearch | gpg --dearmor -o /usr/share/keyrings/elasticsearch-keyring.gpg

RUN echo "deb [signed-by=/usr/share/keyrings/elasticsearch-keyring.gpg] https://artifacts.elastic.co/packages/8.x/apt stable main" | tee /etc/apt/sources.list.d/elastic-8.x.list

RUN apt-get update
RUN apt-get install logstash

COPY logstash.conf /etc/logstash/conf.d/

ENV PATH=/usr/share/logstash/bin:$PATH

RUN mkdir /etc/logstash/ssl

CMD ["logstash", "--path.settings=/etc/logstash"]

#CMD ["tail", "-f", "/dev/null"]
