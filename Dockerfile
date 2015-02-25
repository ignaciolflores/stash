# Install Atlassian Stash
# This is a trusted build, we need postgresql
FROM ubuntu:14.04

MAINTAINER Ignacio López Flores ignacio@introbay.com

# Prepare all the files
ENV AppName stash
ENV AppVer 3.6.1
ENV STASH_HOME /data/stash-home
ENV STASHUSR stash
ADD http://www.atlassian.com/software/stash/downloads/binary/atlassian-stash-$AppVer.tar.gz /opt/atlassian/
ADD ./install_cmds.sh /install_cmds.sh
ADD ./init.sh /init.sh

# Uncomment to enable backup of files on host
VOLUME ["/data"]

## Now Install Atlassian Jira
RUN /install_cmds.sh

# Start the service
CMD ["sh", "/init.sh"]

# Http Port
EXPOSE 10083

# SSH Port
EXPOSE 10083
