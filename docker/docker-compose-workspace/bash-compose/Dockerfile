FROM ubuntu:24.04

# Install curl
RUN apt-get update && apt-get install -y curl

# Copy the script into the container
COPY script.sh /usr/local/bin/script.sh

# Make the script executable
RUN chmod +x /usr/local/bin/script.sh

# Set the default command to run the script
CMD ["/bin/bash", "/usr/local/bin/script.sh"]
