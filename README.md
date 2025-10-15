# DeployJenkinsWithDocker
Tools to deploy Jenkins (or any other docker compose application) with systemd using docker compose

## Adding the service file
- Copy the compose@.service file to /etc/systemd/system/ or wherever your distribution keeps the service files
- Run the command '''systemctl daemon-reload'''

## Create a folder for the service under /opt
- Create a folder under /opt with the name of your service, such as *jenkins*
  - '''# mkdir -p /opt/jenkins'''

## Copy the compose file 
- Copy the application's docker compose file into this folder you want to run as a systemd service

## Enable and start the service
- Turn the service on and start it with the following command:
  - '''# systemctl enable --now compose@jenkins'''
  - The parameter is the name of the folder under /opt created earlier

This approach will work for any project, not just jenkins.
