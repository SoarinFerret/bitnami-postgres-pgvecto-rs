# Bitnami Postgres images w/ pgvecto.rs

I need this for the immich helm chart - I doubt I will continue to use this long term, but it works for now. Use at your own risk.

## Building yourself

I am going to use github actions to publish images on ghcr, and you are welcome to use them, but you are probably better off building your own version to replace the specific image you would like. Use common sense with your image tags (aka, use pg14 on both images). An example:

```bash
$ docker built --build-arg="PGVECTORS_TAG=pg14-v0.1.13-amd64" --build-arg="BITNAMI_TAG=14.5.0-debian-11-r6" -t bitnami-postgres-pgvecto-rs .
```

## Usage

This is a drop in replacement for bitnami postgres debian container. Just swap the image with mine (or preferably, one that you built instead)

In your `values.yaml`:

```yaml
postgressql:
  image:
    repository: soarinferret/bitnami-postgres-pgvecto-rs
    tag: pg14.5-v0.1.13
```

Or `docker-compose.yml`:

```yaml
version: '3'

services:
  db:
    #image: bitnami/postgresql:14.5.0-debian-11-r6
    image: soarinferret/bitnami-postgres-pgvecto-rs:pg14.5-v0.1.13
```