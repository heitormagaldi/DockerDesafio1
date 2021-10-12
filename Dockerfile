FROM golang:1.14 as multstage

WORKDIR /go/src/fullcycle

COPY *.go ./

RUN  GOOS=linux go build -ldflags="-s -w" 



FROM scratch
WORKDIR /go/src/fullcycle
COPY --from=multstage /go/src/fullcycle /go/src/fullcycle
CMD [ "./fullcycle" ] 

   