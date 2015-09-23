#!/bin/bash

# Start Atlassian in the forground
sysctl -w kernel.shmmax=714219520
chown -R $STASHUSR $STASH_HOME
su - "$STASHUSR" -c "export STASH_HOME=$STASH_HOME ; /opt/atlassian/atlassian-bitbucket-$AppVer/bin/start-stash.sh -fg"
