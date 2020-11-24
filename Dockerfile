FROM asciidoctor/docker-asciidoctor:1.2

LABEL MAINTAINERS="Ralf Gnädinger <ralf.gnaedinger@trivadis.com>"

RUN apk add --no-cache \
	g++ \
	make \
	cargo \
	npm \
	imagemagick && \
	ln -s $PWD/node_modules/.bin/mmdc /usr/local/bin/mmdc 

RUN git clone https://github.com/ivanceras/svgbob /tmp/svgbob && \
        cargo build --release --manifest-path /tmp/svgbob/Cargo.toml && \
        cp /tmp/svgbob/target/release/svgbob /usr/local/bin && \
        rm -r /tmp/svgbob && \
        apk del \
        g++ \
        make \
        cargo

CMD ["/bin/bash"]
