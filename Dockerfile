FROM python:2.7

ADD https://storage.googleapis.com/kubernetes-release/release/v1.5.1/bin/linux/amd64/kubectl /usr/local/bin/kubectl
RUN chmod +x /usr/local/bin/kubectl
ENV KUBECONFIG /secret/kubeconfig

ADD playbook /playbook

VOLUME /secret

ADD requirements.txt requirements.txt
RUN pip install -r requirements.txt

WORKDIR /playbook
CMD bash
