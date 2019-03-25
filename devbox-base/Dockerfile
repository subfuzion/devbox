FROM amazonlinux:2

ARG USERID
ARG USERNAME
ARG GROUPID
ARG GROUPNAME

RUN echo "${USERNAME}(${USERID}):${GROUPNAME}(${GROUPID})"

#RUN yum makecache && yum groupinfo base-minimal && yum clean all
# need for commands: groupadd
RUN yum install -y \
	shadow-utils.x86_64 \
	sudo

# disable login for sudo users in wheel
RUN printf \
    "\n## Allows people in group wheel to log in without a password\n%%wheel        ALL=(ALL)       NOPASSWD: ALL" \
    >> /etc/sudoers

# create user to match the host user, add to wheel group for sudo
RUN groupadd -g ${GROUPID} ${GROUPNAME} && \
    useradd -u ${USERID} -g ${GROUPID} -G wheel -s /bin/bash -m ${USERNAME}

# HOME, UID, SHELL are all set automatically, but USER isn't
ENV USER ${USERNAME}

WORKDIR /home/${USERNAME}
