FROM golang:buster AS build
WORKDIR /go/src/github.com/ConorMcNamee/graphql-todo
COPY . .
RUN go version && go env && go build -o /build

FROM gcr.io/distroless/base
COPY --from=build /build /
ENTRYPOINT ["/build"]
EXPOSE 8080