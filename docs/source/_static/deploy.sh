#!/usr/bin/env bash

set -euo pipefail

ARCHIVE_PATH="${ARCHIVE_PATH:-}"
SITE_DIR="${SITE_DIR:-}"
DB_HOST="localhost"
DB_PORT="3306"
DB_ROOT="root"
DB_NAME="${DB_NAME:-}"
DB_USER="${DB_USER:-}"
DB_USER_PASS="${DB_USER_PASS:-}"
WP_HOST="127.0.0.1"
WP_PORT="${WP_PORT:-}"
SITE_URL="${SITE_URL:-}"

prompt() {
  local var_name="$1" prompt_text="$2" default="$3"
  local value
  if [ -n "$default" ]; then
    read -p "$prompt_text [$default]: " value
    value="${value:-$default}"
  else
    read -p "$prompt_text: " value
  fi
  printf -v "$var_name" '%s' "$value"
}

prompt ARCHIVE_PATH "The path to the zip archive of the whitepage" ""
prompt SITE_DIR     "Unpacking folder (will be created in the current directory, specify its name)" ""
prompt WP_PORT      "Host 127.0.0.1 Port for wp server"       "8080"
prompt SITE_URL     "Public address name (whith https://, like https://example.com):" "https://tiendaortiz.com"
prompt DB_NAME      "Name the database being created():"       "wp_restored"
prompt DB_USER      "Name of new creating MySQL-user:" "wpuser"
[ -n "$DB_USER_PASS" ] || { read -s -p "Pass for $DB_USER: " DB_USER_PASS; echo; }

echo "Unpucking $ARCHIVE_PATH → ./$SITE_DIR/"
unzip -q "$ARCHIVE_PATH" -d "./$SITE_DIR"

cd "./$SITE_DIR"

SQL_FILE="db.sql"
if [ ! -f "$SQL_FILE" ]; then
  echo "Error: $SQL_FILE not found!"
  exit 1
fi

echo "Changing PORT in URL on $WP_PORT in $SQL_FILE"
if sed --version >/dev/null 2>&1; then
  sed -i -E "s#(http://[^:]+:)[0-9]+#\1${WP_PORT}#g" "$SQL_FILE"
else
  sed -i '' -E "s#(http://[^:]+:)[0-9]+#\1${WP_PORT}#g" "$SQL_FILE"
fi

WP_CONFIG="wp-config.php"
if [ ! -f "$WP_CONFIG" ]; then
  echo "ERROR: $WP_CONFIG not found!"
  exit 1
fi

if sed --version >/dev/null 2>&1; then
  SED_INPLACE=( -i )
else
  SED_INPLACE=( -i '' )
fi

echo "Updating sattings of DB in $WP_CONFIG..."
sed "${SED_INPLACE[@]}" -E \
  -e "s/define\(\s*'DB_NAME'\s*,\s*'.*'\s*\);/define('DB_NAME','${DB_NAME}');/" \
  -e "s/define\(\s*'DB_USER'\s*,\s*'.*'\s*\);/define('DB_USER','${DB_USER}');/" \
  -e "s/define\(\s*'DB_PASSWORD'\s*,\s*'.*'\s*\);/define('DB_PASSWORD','${DB_USER_PASS}');/" \
  -e "s#define\(\s*'DB_HOST'\s*,\s*'.*'\s*\);#define('DB_HOST','${DB_HOST}:${DB_PORT}');#" \
  "$WP_CONFIG"

echo "WP-config updated:
  DB_NAME     = ${DB_NAME}
  DB_USER     = ${DB_USER}
  DB_PASSWORD = (скрыт)
  DB_HOST     = ${DB_HOST}:${DB_PORT}"

MYSQL_CMD="mysql -h$DB_HOST -P$DB_PORT -u$DB_ROOT"

echo "Creating $DB_NAME, user $DB_USER and giving them rules..."
$MYSQL_CMD <<SQL
CREATE DATABASE IF NOT EXISTS \`$DB_NAME\` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PASS';
GRANT ALL PRIVILEGES ON \`$DB_NAME\`.* TO '$DB_USER'@'%';
FLUSH PRIVILEGES;
SQL

echo "Import dump of wpDB in $DB_NAME..."
mysql -h"$DB_HOST" -P"$DB_PORT" -u"$DB_ROOT" "$DB_NAME" < "$SQL_FILE"

echo "Import succress"

if command -v wp >/dev/null; then
  echo "Replacing whith search-replace use WP-CLI..."
  wp search-replace "http://127.0.0.1:${WP_PORT}" "${SITE_URL}" --skip-columns=guid --path="./" --allow-root
else
  echo "❌ WP-CLI  not found , stop search-replace."
fi

cat <<EOF

✅ White successfully applied in  Folder ./$(basename "$SITE_DIR")

📌 For start working WP site use this command:
   wp server --path=./$(basename "$SITE_DIR") --host=$WP_HOST --port=$WP_PORT --allow-root

EOF