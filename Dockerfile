FROM alpine:3.12.0

WORKDIR /home/user

RUN apk --no-cache add \
        g++ \
        gcc \
        git \
        make \
        su-exec

RUN git clone https://github.com/sass/sassc.git -b 3.6.1 && \
    . sassc/script/bootstrap && \
    make -C sassc -j4 && \
    PREFIX="/usr" make -C sassc install

COPY entrypoint.sh .

ENTRYPOINT [ "./entrypoint.sh" ]
