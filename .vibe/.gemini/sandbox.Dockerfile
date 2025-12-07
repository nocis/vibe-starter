# Use the official Node.js slim image
FROM node:lts-slim

ARG USER_ID=1000
ARG GROUP_ID=1000
ARG USERNAME=gemini

# 1. Install System Dependencies (as root)
# We do this first to leverage cache and because apt requires root
# rm -rf /var/lib/apt/lists/* reduce container size
RUN apt-get update && apt-get install -y \
    curl \
    bash \
    neovim \
    git \
    python3-dev \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Install starship
RUN curl -sS https://starship.rs/install.sh | sh -s -- -y

# del 1000 first
RUN userdel -r $(getent passwd 1000 | cut -d: -f1) || true && \
    groupdel $(getent group 1000 | cut -d: -f1) || true 

# 2. Create the 'gemini' user with the specific UID/GID
# We create the group first, then the user attached to that group
# -l flag prevents large image!
RUN groupadd -g ${GROUP_ID} ${USERNAME} && \
    useradd -l -u ${USER_ID} -g ${USERNAME} -m -s /bin/bash ${USERNAME}


# When you mount a volume the permissions of /app inside the container 
# are overwritten by the permissions of the folder on your host machine.
# RUN chown ${USERNAME}:${USERNAME} /app will be overwritten at runtime
WORKDIR /app


# 4. Handle Entrypoint
# Copy with ownership set to gemini so they can execute it
COPY --chown=${USERNAME}:${USERNAME} entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# ==========================================
# Switch to the non-root user
# ==========================================
USER ${USERNAME}
ENV HOME=/home/${USERNAME}

# 5. Configure NPM for non-root global installs
# Create a directory for global packages in the user's home
RUN mkdir ${HOME}/.npm-global

# Tell NPM where to install global packages
RUN npm config set prefix ${HOME}/.npm-global

# Add the new global bin directory to the PATH
ENV PATH=${HOME}/.npm-global/bin:${PATH}

# Install gemini CLI
RUN npm install -g @google/gemini-cli

# Configure starship from a URL
RUN mkdir -p ${HOME}/.config && curl -sS https://raw.githubusercontent.com/nocis/archdots/refs/heads/main/config/starship/pure.toml -o ${HOME}/.config/starship.toml

# Initialize starship in .bashrc for root user
RUN echo 'eval "$(starship init bash)"' >> ${HOME}/.bashrc

# Set the entrypoint
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

