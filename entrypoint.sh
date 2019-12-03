#!/usr/bin/env sh

UMASK=$(which umask)
UMASK_SET=${UMASK_SET:-022}

if [[ ! -x $UMASK ]]; then
  echo "umask binary not found"
  exit 1
fi

echo $UMASK "$UMASK_SET"
$UMASK "$UMASK_SET"

DELUGE_WEB=$(which deluge-web)
DELUGE_WEB_LOGLEVEL=${DELUGE_WEB_LOGLEVEL:-info}
DELUGE_WEB_CONFIG=${DELUGE_WEB_CONFIG:-/config}
DELUGE_WEB_LOG=${DELUGE_WEB_LOG:-${DELUGE_WEB_CONFIG}/deluge-web.log}

if [[ ! -x $DELUGE_WEB ]]; then
  echo "deluge-web binary not found"
  exit 1
fi

echo $DELUGE_WEB -c ${DELUGE_WEB_CONFIG}/ -d --loglevel=${DELUGE_WEB_LOGLEVEL} -l ${DELUGE_WEB_LOG}
$DELUGE_WEB -c ${DELUGE_WEB_CONFIG}/ -d --loglevel=${DELUGE_WEB_LOGLEVEL} -l ${DELUGE_WEB_LOG}