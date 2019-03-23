FROM amazonlinux:2

ARG USERID
ARG USERNAME
ARG GROUPID
ARG GROUPNAME

RUN echo "${USERNAME}(${USERID}):${GROUPNAME}(${GROUPID})"
RUN yum install -y shadow-utils.x86_64

RUN groupadd -g ${GROUPID} ${GROUPNAME} && \
    useradd -g ${GROUPID} -u ${USERID} -s /bin/bash -m ${USERNAME}

# HOME, UID, SHELL are all set automatically, but the following aren't
ENV USER ${USERNAME}
WORKDIR /home/${USERNAME}

