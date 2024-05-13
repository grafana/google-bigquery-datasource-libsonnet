ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

.PHONY: generator/schema.json bigquery-query-libsonnet/main.libsonnet bigquery-query-libsonnet/docs/

all: generator/schema.json bigquery-query-libsonnet/main.libsonnet bigquery-query-libsonnet/docs/

generator/schema.json:
	sh ./generate_schema.sh

bigquery-query-libsonnet/main.libsonnet:
	jsonnet -J generator/vendor -S $(ROOT_DIR)/generator/main.libsonnet \
		| jsonnetfmt --no-use-implicit-plus - > $(ROOT_DIR)/bigquery-query-libsonnet/main.libsonnet

bigquery-query-libsonnet/docs/:
	@rm -rf bigquery-query-libsonnet/docs/ && \
	jsonnet -J generator/vendor -S -c -m bigquery-query-libsonnet/docs/ \
			--exec "(import 'doc-util/main.libsonnet').render(import 'bigquery-query-libsonnet/main.libsonnet')"
