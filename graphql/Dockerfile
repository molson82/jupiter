FROM golang:1.16.5-alpine3.13
RUN mkdir /app
COPY . /app
WORKDIR /app
RUN go build -o bin/graphql -v .
EXPOSE 8881
CMD [ "/app/bin/graphql" ]