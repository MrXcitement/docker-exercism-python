FROM debian:9

LABEL maintainer="mike@thebarkers.com" \
      description="An exercism 'python' track image." \
      version="0.1.1"

# Update Debian and Install dev tools
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y \
       git \
       procps \
       tree \
       vim \
       wget

# Install exercism
RUN cd /tmp \
    && wget https://github.com/exercism/cli/releases/download/v3.0.11/exercism-linux-64bit.tgz \
    && tar xzf exercism-linux-64bit.tgz \
    && mv exercism /usr/local/bin/

# Install pyenv prerequisites 
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y \
       build-essential \
       curl \
       libbz2-dev \
       libffi-dev \
       liblzma-dev \
       libncurses5-dev \
       libncursesw5-dev \
       libreadline-dev \
       libsqlite3-dev \
       libssl-dev \
       llvm \
       make \
       tk-dev \
       xz-utils \
       zlib1g-dev

# Install pyenv
RUN curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash

# Configure pyenv
RUN echo 'export PATH="/root/.pyenv/bin:$PATH"' >> /root/.profile \
    && echo 'eval "$(pyenv init -)"' >> /root/.profile \
    && echo 'eval "$(pyenv virtualenv-init -)"' >> /root.profile

# Install pyenv python versions
SHELL ["/bin/bash", "-c"]
RUN source /root/.profile \
    && pyenv install $(pyenv install -l | grep '  3.7' | tail -n1) \
    && pyenv install $(pyenv install -l | grep '  3.6' | tail -n1) \
    && pyenv install $(pyenv install -l | grep '  3.5' | tail -n1) \
    && pyenv install $(pyenv install -l | grep '  2.7' | tail -n1) \
    && pyenv global $(pyenv versions --bare | grep 2\.) $(pyenv versions --bare | grep 3\. | sort -r)

# Clean up
RUN apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /root/exercism

CMD ["bash", "--login"]
