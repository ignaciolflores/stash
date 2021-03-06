#!/bin/bash
# Copyright 2014, Tom Eklöf, Mogul AB
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.


# Install Atlassian Stash

## Install Java
# Add Oracle Java PPA
apt-get -y update
apt-get -y install software-properties-common python-software-properties git
add-apt-repository -y ppa:webupd8team/java
apt-get -y update
# Auto-accept the Oracle License
echo "debconf shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections
echo "debconf shared/accepted-oracle-license-v1-1 seen true" | debconf-set-selections
apt-get -y install libpq-dev oracle-java8-installer

set -x

useradd --system --home $BITBUCKET_HOME --user-group $BITBUCKETUSR   # Debian way

## Now Install Atlassian Stash
mkdir -p /opt/atlassian/
tar xzf /opt/atlassian/atlassian-$AppName-$AppVer.tar.gz -C /opt/atlassian/ --owner=$BITBUCKETUSR
mkdir -p $BITBUCKET_HOME
chown -R $BITBUCKETUSR /opt/atlassian/atlassian-$AppName-$AppVer
chown -R $BITBUCKETUSR $BITBUCKET_HOME

# Clean up
rm -f /opt/atlassian/atlassian-$AppName-$AppVer.tar.gz
rm -f /var/cache/oracle-jdk7-installer/jdk-7u76-linux-x64.tar.gz
