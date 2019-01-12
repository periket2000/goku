FROM golang:latest AS compile

WORKDIR /src
RUN mkdir /api
COPY ./ ./
RUN CGO_ENABLED=0 GOOS=linux go build -o /api/server

FROM scratch
COPY --from=compile /api/server /api/
CMD ["/api/server"]
