#!/bin/bash
mkdir -p /opt/codellama
cd /opt/codellama
git clone https://github.com/BerriAI/litellm-CodeLlama-server.git
cd litellm-CodeLlama-server

# Build a local image
sudo docker build -t litellm-codellama-server:latest .
