FROM golang:1.16.5-alpine3.13
RUN mkdir /app
COPY . /app
WORKDIR /app
RUN go build -o bin/jupiter -v .
EXPOSE 8888
CMD [ "/app/bin/jupiter" ]
