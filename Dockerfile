FROM alpine:3.5 
RUN apk update && \ 
      apk add --update alpine-sdk 
RUN mkdir /app 
WORKDIR /app 
COPY main.c /app 
RUN mkdir bin 
RUN gcc -Wall main.c -o bin/hello 
CMD /app/bin/hello
