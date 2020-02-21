FROM ubuntu

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && \
    apt-get install -y apt-transport-https ca-certificates gnupg curl

RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" > /etc/apt/sources.list.d/google-cloud-sdk.list && \
    curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add - && \
    apt-get update && \
    apt-get install -y google-cloud-sdk

RUN rm -rf /var/lib/apt/lists/*

COPY entrypoint /usr/local/bin/

ENTRYPOINT ["/usr/local/bin/entrypoint"]
CMD ["--help"]