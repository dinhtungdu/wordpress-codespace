FROM wordpress

# Create .vscode-server for Codespace and devcontainer
RUN mkdir /var/www/.vscode-server && chown www-data: /var/www/.vscode-server

# Install git & zip
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git && \
    apt-get install -y zip

SHELL ["/bin/bash", "--login", "-c"]

# Install nvm and node
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
RUN nvm install --lts

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install WP CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
        chmod +x wp-cli.phar && \
        mv wp-cli.phar /usr/local/bin/wp

WORKDIR /var/www/html
