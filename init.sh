#!/bin/bash

# Start Atlassian in the forground
sysctl -w kernel.shmmax=714219520
chown -R $BITBUCKETUSR $BITBUCKET_HOME
su - "$BITBUCKETUSR" -c "export BITBUCKET_HOME=$BITBUCKET_HOME ; /opt/atlassian/atlassian-$AppName-$AppVer/bin/start-$AppName.sh -fg"
