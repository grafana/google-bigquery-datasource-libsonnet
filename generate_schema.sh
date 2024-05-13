#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(readlink -f $(dirname "$0"))"

#TEMP=$ROOT_DIR
TEMP=$(mktemp -d)
function finish {
  rm -rf $TEMP
}
trap finish EXIT

cd $TEMP

git clone --depth=1 https://github.com/grafana/google-bigquery-datasource
cd google-bigquery-datasource/

cat <<EOL > ./src/utils/formatSQL.ts
export function formatSQL(q: string) {
  return q;
}
EOL

yarn install
npx --yes ts-json-schema-generator -p ./src/types.ts --tsconfig ./tsconfig.json -t QueryModel -o ${ROOT_DIR}/generator/schema.json
