FROM alpine:3.12.0

RUN apk --update add \
        g++ \
        gcc \
        git \
        make

RUN git clone https://github.com/sass/sassc.git -b 3.6.1 && \
    . sassc/script/bootstrap && \
    make -C sassc -j4 && \
    PREFIX="/usr" make -C sassc install

ENTRYPOINT [ "sassc" ]
