FROM jenkins/jenkins:lts
USER root

# Install required packages including lsb-release
RUN apt-get update -qq && apt-get install -qqy \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    lsb-release \
    software-properties-common \
    git

# Add Docker's official GPG key
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -

# Add Docker repository manually (preferred over add-apt-repository in Docker build)
RUN echo "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list

# Update package lists then install docker-ce-cli (Docker client only)
RUN apt-get update -qq && apt-get install -y docker-ce-cli

# Add Jenkins user to docker group for permission to access Docker daemon
RUN groupadd -f docker && usermod -aG docker jenkins

# USER jenkins
