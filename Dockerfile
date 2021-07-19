FROM alpine:3

WORKDIR /cli

RUN set -x \ 
    && apk add --no-cache python3 py3-pip git bash unzip wget \
    && pip3 install --upgrade pip \
    && pip3 install awscli

RUN wget https://releases.hashicorp.com/terraform/0.13.7/terraform_0.13.7_linux_amd64.zip \ 
    && unzip terraform_0.13.7_linux_amd64.zip \ 
    && rm -rf terraform_0.13.7_linux_amd64.zip \
    && mv ./terraform /usr/bin/

COPY terraform_deploy.sh .
RUN chmod +x terraform_deploy.sh

ENTRYPOINT [ "./terraform_deploy.sh" ]
