docker-carbon-relay-ng
======================

Docker image for carbon-relay-ng

    OS Base : busybox:ubuntu-14.04
    Exposed Ports : 2003 2004 8081

Environment Variables
---------------------
    LOG_LEVEL
        Set the log level, either critical, error, warning, notice, info or debug
    BAD_METRICS_MAX_AGE
        How long to keep track of invalid metrics seen
    INIT
        Comma seprated init commands

Services
--------

  * carbon-relay-ng

A small container used to run [carbon-relay-ng](https://github.com/graphite-ng/carbon-relay-ng).
Use the `INIT` environment variable to fill the init section in the configuration file.

Example Usage
-------------

```
docker run -d -P \
    -e INIT="'addRoute sendAllMatch carbon-default  graphite:2003 spool=true pickle=false','addRoute sendAllMatch carbon-tagger sub==  127.0.0.1:2006'" \
    -e LOG_LEVEL='info' \
    -e BAD_METRICS_MAX_AGE="48h" \
    yasn77/docker-carbon-relay-ng
```
