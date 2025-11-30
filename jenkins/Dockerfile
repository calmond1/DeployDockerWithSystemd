FROM jenkins/jenkins:lts
USER root

# Install required packages
RUN apt-get update -qq && apt-get install -qqy \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    git \
    && rm -rf /var/lib/apt/lists/*

# Add Docker's official GPG key to keyring file (no apt-key)
RUN install -m 0755 -d /etc/apt/keyrings && \
    curl -fsSL https://download.docker.com/linux/debian/gpg \
      | gpg --dearmor -o /etc/apt/keyrings/docker.gpg && \
    chmod a+r /etc/apt/keyrings/docker.gpg

# Add Docker repository with signed-by
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/debian $(lsb_release -cs) stable" \
  > /etc/apt/sources.list.d/docker.list

# Update package lists then install docker-ce-cli (Docker client only)
RUN apt-get update -qq && apt-get install -y docker-ce-cli && \
    rm -rf /var/lib/apt/lists/*

# Add Jenkins user to docker group for permission to access Docker daemon
RUN groupadd -f docker && usermod -aG docker jenkins

# USER jenkins
