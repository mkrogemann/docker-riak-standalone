# docker-riak-standalone

## What is this image good for?

This image should allow you to bring up a Riak single node server that uses leveldb as its storage backend and enables the solr based search.

Why did I create it? There are a lot of alternatives around, often times these alternatives are far more generic and configurable than this image. But I found none of them to be working well for me and begin up to date with respect to recent Riak releases. We use 2.2.5 here and this is hard wired as it's good enough for me.

## Build

```shell
docker build --rm -t mkrogemann/riak-standalone .
```

## Use

For advanced use cases and a configuration reference, head over to the docker documentation pages: https://docs.docker.com/

For a very basic setup (ephemeral, no data will survive container destruction), you can use this very simple `docker-compose.yml`:

```docker
version: "3"
services:
  riak-standalone:
    container_name: riak-standalone
    image: mkrogemann/riak-standalone
    ports:
      - "8087:8087"
      - "8098:8098"
```
