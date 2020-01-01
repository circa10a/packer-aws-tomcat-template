#!/usr/bin/env bash

TOMCAT_VERSION=${TOMCAT_VERSION:-"9.0.30"}
JAVA_VERSION=${JAVA_VERSION:="1.8.0"}
INSTALL_DIR=${INSTALL_DIR:-"/tomcat"}
USER="tomcat"
USERID="1001"
GROUPID="1001"

# Update sources & packages
sudo yum update -y && \
sudo yum upgrade -y
# Install JRE
# Java 11
if [[ "$JAVA_VERSION" =~ .*11.* ]]; then
    sudo amazon-linux-extras install java-openjdk11 -y
else
    sudo yum install "java-${JAVA_VERSION}-openjdk-headless.x86_64" -y
fi
# Add non-root user
sudo groupadd --gid "$GROUPID" "$USER" && \
    sudo adduser \
    --comment "" \
    --home "$INSTALL_DIR" \
    --gid "$GROUPID" \
    --no-create-home \
    --uid "$USERID" \
    "$USER"
# Download tomcat
sudo wget -qO- "https://www-us.apache.org/dist/tomcat/tomcat-9/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz" | sudo tar xvz -C /
# Change Permissions
sudo chown -R "$USERID":"$GROUPID" "/apache-tomcat-${TOMCAT_VERSION}"
sudo ln -sf "/apache-tomcat-${TOMCAT_VERSION}" "$INSTALL_DIR"