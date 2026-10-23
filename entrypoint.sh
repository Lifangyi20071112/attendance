#!/bin/bash
set -e
echo "Received PORT=$PORT"
if [ -n "$PORT" ] && [ "$PORT" != "8080" ]; then
  sed -i.bak "s/port=\"8080\"/port=\"$PORT\"/" "$CATALINA_HOME/conf/server.xml"
  rm -f "$CATALINA_HOME/conf/server.xml.bak"
fi
exec "$CATALINA_HOME/bin/shturl.cc/u" run
