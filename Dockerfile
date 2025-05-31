FROM registry.access.redhat.com/ubi9/python-39

USER root

RUN dnf install -y \
    ansible-core \
    sshpass \
    git \
    vim \
    && dnf clean all

WORKDIR /ansible
CMD ["bash"]
