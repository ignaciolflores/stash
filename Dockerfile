# Install Atlassian Stash
FROM ubuntu:14.04

MAINTAINER Ignacio López Flores ignacio@introbay.com

# Prepare all the files
ENV AppName bitbucket
ENV AppVer 4.0.0
ENV BITBUCKET_HOME /data/stash-home
ENV BITBUCKETUSR stash
ADD http://www.atlassian.com/software/stash/downloads/binary/atlassian-$AppName-$AppVer.tar.gz /opt/atlassian/
ADD ./install_cmds.sh /install_cmds.sh
ADD ./init.sh /init.sh

# Uncomment to enable backup of files on host
VOLUME ["/data"]

## Now Install Atlassian Stash
RUN /install_cmds.sh

# Start the service
CMD ["sh", "/init.sh"]

# Http Port
EXPOSE 7990

# SSH Port
EXPOSE 7999
