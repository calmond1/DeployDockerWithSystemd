# DeployJenkinsWithDocker
Tools to deploy Jenkins (or any other docker compose application) with systemd using docker compose

## Adding the service file
- Copy the compose@.service file to /etc/systemd/system/ or wherever your distribution keeps the service files
- Run the command `systemctl daemon-reload` as root

## Create a folder for the service under /opt
- Create a folder under /opt with the name of your service, such as *jenkins*
  - Run the command `mkdir -p /opt/jenkins` as root

## Copy the compose file 
- Copy the application's docker compose file into this folder you want to run as a systemd service
  - In this example the Jenkins deployment is customized to control docker on the host, so the Dockerfile is also needed in the same folder
- **Note:** The docker compose file cannot have `restart: always`.  Use `restart: unless-stopped` 

## Enable and start the service
- Turn the service on and start it by running the following command as root: `systemctl enable --now compose@jenkins`
  - **Note:** The parameter after the @ is the name of the folder under /opt created earlier

This approach will work for any project, not just jenkins.
