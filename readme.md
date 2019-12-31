# docker-crontab

[![Docker Automated build](https://img.shields.io/docker/cloud/automated/tinslice/crontab.svg?style=flat)](https://hub.docker.com/r/tinslice/crontab/builds)
[![Docker Build Status](https://img.shields.io/docker/cloud/build/tinslice/crontab.svg?style=flat)](https://hub.docker.com/r/tinslice/crontab/builds)
[![Docker Pulls](https://img.shields.io/docker/pulls/tinslice/crontab.svg?style=flat)](https://hub.docker.com/r/tinslice/crontab/)
[![license](https://img.shields.io/github/license/tinslice/docker-crontab.svg)](https://github.com/tinslice/docker-crontab)

Docker image for running cron jobs.

## Usage

In order to create cron jobs add environment properties that start with 'CRON_' (the name must be unique) and have the value with the format `<cron-value> <command>`.

The cron commands output can be found in '/var/log/cron.log' .

## Examples

```bash
docker run --rm -e CRON_SAMPLE="* * * * * echo 1 minute cron"  tinslice/crontab
```

### docker-compose example

```yaml
version: '3.7'

services:
  cron:
    image: tinslice/crontab
    container_name: crontab
    environment: 
      CRON_SAMPLE: '* * * * * echo 1 minute cron'
      CRON_ANOTHER_SAMPLE: '*/5 * * * * echo 5 minute cron'
      CRON_ERROR_SAMPLE: '*/3 * * * * no-valid-command'
```

Check logs

```bash
docker logs -f crontab
```