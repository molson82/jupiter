FROM golang:1.16.5-alpine3.13
RUN mkdir /app
COPY . /app
WORKDIR /app
RUN go build -o bin/btc -v .
EXPOSE 8882
CMD [ "/app/bin/btc" ]