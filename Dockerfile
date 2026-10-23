#!/bin/bash
if [ -n "$PORT" ] && [ "$PORT" != "8080" ]; then
  sed -i.bak "s/port=\"8080\"/port=\"$PORT\"/" "$CATALINA_HOME/conf/server.xml"
  rm -f "$CATALINA_HOME/conf/server.xml.bak"
fi

# 新增：放一个跳转页面到ROOT，访问 / 自动跳转到 /attendance
mkdir -p "$CATALINA_HOME/webapps/ROOT"
cat > "$CATALINA_HOME/webapps/ROOT/index.html" <<EOF
<html>
<head>
<meta http-equiv="refresh" content="0;url=/attendance">
</head>
</html>
EOF

exec "$CATALINA_HOME/bin/catalina.sh" run
