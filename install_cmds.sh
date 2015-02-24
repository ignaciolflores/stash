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
apt-get -y install python-software-properties
add-apt-repository -y ppa:webupd8team/java
apt-get -y update
# Auto-accept the Oracle License
echo "debconf shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections
echo "debconf shared/accepted-oracle-license-v1-1 seen true" | debconf-set-selections
apt-get -y install libpq-dev oracle-java7-installer

set -x

useradd --system --home $STASH_HOME --user-group $STASHUSR   # Debian way

## Now Install Atlassian Stash
mkdir -p /opt/atlassian/
tar xzf /opt/atlassian/atlassian-$AppName-$AppVer.tar.gz -C /opt/atlassian/ --owner=$STASHUSR
mkdir -p $STASH_HOME
chown -R $STASHUSR /opt/atlassian/atlassian-$AppName-$AppVer
chown -R $STASHUSR $STASH_HOME

# Clean up
rm -f /opt/atlassian/atlassian-$AppName-$AppVer.tar.gz
rm -f /var/cache/oracle-jdk7-installer/jdk-7u45-linux-x64.tar.gz
