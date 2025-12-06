# Use the official Node.js slim image
FROM node:lts-slim

WORKDIR /app

# Install yarn and claude CLI
RUN npm install -g @anthropic-ai/claude-code

# Install curl and bash, which are required for starship installation
RUN apt-get update && apt-get install -y curl bash neovim git python3-dev python3-pip

# Install starship
RUN curl -sS https://starship.rs/install.sh | sh -s -- -y

# Configure starship from a URL
RUN mkdir -p /root/.config && curl -sS https://raw.githubusercontent.com/nocis/archdots/refs/heads/main/config/starship/pure.toml -o /root/.config/starship.toml

# Initialize starship in .bashrc for root user
RUN echo 'eval "$(starship init bash)"' >> /root/.bashrc


COPY entrypoint.sh /usr/local/bin/entrypoint.sh

# Make it executable
RUN chmod +x /usr/local/bin/entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
