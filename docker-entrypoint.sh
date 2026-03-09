#!/bin/sh
set -e

HIDE_PW_VAL=$([ "$HIDE_PASSWORD_LOGIN" = "true" ] && echo true || echo null)

# Generate config.json from environment variables
cat > /usr/share/nginx/html/assets/config/config.json <<EOF
{
  "baseUrl": "$BASE_URL",
  "seerrBaseUrl": "$SEERR_BASE_URL",
  "hidePasswordLogin": $HIDE_PW_VAL
}
EOF

exec nginx -g "daemon off;"
