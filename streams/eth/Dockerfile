FROM golang:1.16.5-alpine3.13
RUN mkdir /app
COPY . /app
WORKDIR /app
RUN go build -o bin/eth -v .
EXPOSE 8883
CMD [ "/app/bin/eth" ]