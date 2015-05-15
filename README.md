Docker + Stash + Database container = Love!

# Introduction

This is a fork from https://github.com/docker-atlassian/stash. The main proposal is to have an updated version of the docker and with a separated database container, so everyone can choose either the database engine, create a new one or use an existing container.

# Installation

You can build the image yourself.

```
git clone https://github.com/ignaciolflores/stash.git
cd stash
docker build -t="$USER/stash:3.9.1" .
```

# Quick Start

Pull the latest postgres version from the Docker Trusted Build.

```
docker pull sameersbn/postgresql:9.1-1
```

Create an instance of the docker database

```
docker run --name jira-postgresql -d \
  -e 'DB_USER=dbuser' -e 'DB_PASS=dbpass' -e 'DB_NAME=dbname' \
  sameersbn/postgresql:9.1-1
```

Or create a new database
```
CREATE ROLE stashuser WITH LOGIN PASSWORD 'jellyfish' VALID UNTIL 'infinity';
 
CREATE DATABASE stashdb WITH ENCODING='UTF8' OWNER=stashuser CONNECTION LIMIT=-1;
```

Create an instance of the Stash docker linked to the database docker image.

```
docker run --name stash -d \
    -p local_port:7990 \
    -v /local/dir/application-data:/opt/atlassian/application-data \
    --link jira-postgresql:db.stash \
    "$USER"/stash:3.6.1 \
    /init.sh
```

When the container have started, go to the IPs port 7990 and choose the following options:

Database:

- Type: External
- hostname: db.stash
- Port: 5432
- Name: stashdb
- Username: stashuser
- Password: jellyfish
 
# Contributing

1. Fork the repository on Github
2. Create a named feature branch (like add_component_x)
3. Write your change
4. Submit a Pull Request using Github

