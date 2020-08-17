FROM cirrusci/flutter

USER root
WORKDIR /tmp

# awscli install
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && unzip awscliv2.zip && ./aws/install

RUN apt -y update

# npm install
RUN apt install -y gpg gnupg
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - && apt install -y nodejs

# amplify install
RUN npm install -g @aws-amplify/cli

# githubのknwon_hosts追加
RUN mkdir -p /root/.ssh && ssh-keyscan github.com >> /root/.ssh/known_hosts
