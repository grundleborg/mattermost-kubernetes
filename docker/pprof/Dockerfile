FROM golang:latest

ENV PATH="/go/bin:${PATH}"

WORKDIR .

ADD *.sh .
RUN chmod +x *.sh

RUN apt-get update && apt-get install graphviz -y

RUN mkdir -p src/github.com/crspeller
RUN wget https://github.com/crspeller/mattermost-poster/archive/master.tar.gz && mv master.tar.gz src/github.com/crspeller && cd src/github.com/crspeller && tar -zxvf master.tar.gz && rm master.tar.gz
RUN cd src/github.com/crspeller && mv mattermost-poster-master mattermost-poster
RUN cd src/github.com/crspeller/mattermost-poster && go install

CMD ["./dopprof.sh"]
