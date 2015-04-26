#!/bin/sh 

[ -z "${LOG_LEVEL}" ] || sed -e "s/^\(log_level\s*=\s*\).*/\1'${LOG_LEVEL}'/" -i carbon-relay-ng.ini
[ -z "${BAD_METRICS_MAX_AGE}" ] || sed -e "s/^\(bad_metrics_max_age\s*=\s*\).*/\1'${BAD_METRICS_MAX_AGE}'/" -i carbon-relay-ng.ini
[ -z "${INIT}" ] || awk -v RS='' -v init_line="${INIT}" '{print gensub(/(init\s+=\s+\[)(.*)/, "\\1\n"init_line",\\2","g",$0) }' carbon-relay-ng.ini > new.ini
[ -f /new.ini ] && mv /new.ini /carbon-relay-ng.ini

/carbon-relay-ng /carbon-relay-ng.ini
