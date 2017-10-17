FROM alpine:3.5 AS build
RUN apk update && \ 
      apk add --update alpine-sdk 
RUN mkdir /app 
WORKDIR /app 
COPY main.c /app 
RUN mkdir bin 
RUN gcc -Wall -O3 -static main.c -o bin/hello

FROM scratch
COPY --from=build /app/bin/hello /app/hello
CMD ["/app/hello"]
