FROM amazonlinux:2

RUN yum makecache \
    && yum install -y yum-utils && yum-config-manager --enable extras \
    && yum groupinstall -y \
        base-minimal \
        "Development Tools" \
    && yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
    && yum-config-manager --enable epel \
    && yum install -y \
        clang \
        gnupg \
        kernel-headers \
        libedit-devel \
        ncurses-devel \
        patchutils \
        vim-enhanced \
        wget \
    && rm -rf /var/cache/yum
