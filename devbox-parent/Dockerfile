FROM devbox-base-buildtools

# need for commands: groupadd
RUN yum install -y \
	shadow-utils.x86_64 \
	sudo

# disable login for sudo users in wheel
RUN printf \
    "\n## Allows people in group wheel to log in without a password\n%%wheel        ALL=(ALL)       NOPASSWD: ALL" \
    >> /etc/sudoers

#
# execute the following in next build stage
# 
ONBUILD ARG USERID
ONBUILD ARG USERNAME
ONBUILD ARG GROUPID
ONBUILD ARG GROUPNAME

ONBUILD RUN echo "${USERNAME}(${USERID}):${GROUPNAME}(${GROUPID})"

# create user to match host user, ensure granted sudo by adding to wheel
ONBUILD RUN groupadd -g ${GROUPID} ${GROUPNAME} && \
    useradd -u ${USERID} -g ${GROUPID} -G wheel -s /bin/bash -m ${USERNAME}

# HOME, UID, SHELL are all set automatically, but USER isn't
ONBUILD ENV USER ${USERNAME}

ONBUILD WORKDIR /home/${USERNAME}
