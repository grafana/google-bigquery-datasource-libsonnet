{
  '#': { filename: 'main.libsonnet', help: 'Jsonnet library for creating Bigquery queries for Grafana.\n## Install\n\n```\njb install github.com/grafana/google-bigquery-datasource-libsonnet/bigquery-query-libsonnet@main\n```\n\n## Usage\n\n```jsonnet\nlocal bigquery = import "github.com/grafana/google-bigquery-datasource-libsonnet/bigquery-query-libsonnet/main.libsonnet"\n```\n', 'import': 'github.com/grafana/google-bigquery-datasource-libsonnet/bigquery-query-libsonnet/main.libsonnet', installTemplate: '\n## Install\n\n```\njb install %(url)s@%(version)s\n```\n', name: 'bigquery', url: 'github.com/grafana/google-bigquery-datasource-libsonnet/bigquery-query-libsonnet', usageTemplate: '\n## Usage\n\n```jsonnet\nlocal %(name)s = import "%(import)s"\n```\n', version: 'main' },
  withConnectionArgs(value): {
    connectionArgs: value,
  },
  withConnectionArgsMixin(value): {
    connectionArgs+: value,
  },
  connectionArgs+:
    {
      '#withDataset': { 'function': { args: [{ default: null, enums: null, name: 'value', type: ['string'] }], help: '' } },
      withDataset(value): {
        connectionArgs+: {
          dataset: value,
        },
      },
      '#withLocation': { 'function': { args: [{ default: null, enums: null, name: 'value', type: ['string'] }], help: '' } },
      withLocation(value): {
        connectionArgs+: {
          location: value,
        },
      },
      '#withTable': { 'function': { args: [{ default: null, enums: null, name: 'value', type: ['string'] }], help: '' } },
      withTable(value): {
        connectionArgs+: {
          table: value,
        },
      },
    },
  withDatasource(value): {
    datasource: value,
  },
  withDatasourceMixin(value): {
    datasource+: value,
  },
  datasource+:
    {
      '#withType': { 'function': { args: [{ default: null, enums: null, name: 'value', type: ['string'] }], help: 'The plugin type-id' } },
      withType(value): {
        datasource+: {
          type: value,
        },
      },
      '#withUid': { 'function': { args: [{ default: null, enums: null, name: 'value', type: ['string'] }], help: 'Specific datasource instance' } },
      withUid(value): {
        datasource+: {
          uid: value,
        },
      },
    },
  '#withFormat': { 'function': { args: [{ default: null, enums: [0, 1], name: 'value', type: ['number'] }], help: '' } },
  withFormat(value): {
    format: value,
  },
  '#withHide': { 'function': { args: [{ default: true, enums: null, name: 'value', type: ['boolean'] }], help: 'true if query is disabled (ie should not be returned to the dashboard) Note this does not always imply that the query should not be executed since the results from a hidden query may be used as the input to other queries (SSE etc)' } },
  withHide(value=true): {
    hide: value,
  },
  '#withKey': { 'function': { args: [{ default: null, enums: null, name: 'value', type: ['string'] }], help: 'Unique, guid like, string (used only in explore mode)' } },
  withKey(value): {
    key: value,
  },
  '#withQueryType': { 'function': { args: [{ default: null, enums: null, name: 'value', type: ['string'] }], help: 'Specify the query flavor TODO make this required and give it a default' } },
  withQueryType(value): {
    queryType: value,
  },
  '#withRawSql': { 'function': { args: [{ default: null, enums: null, name: 'value', type: ['string'] }], help: '' } },
  withRawSql(value): {
    rawSql: value,
  },
  '#withRefId': { 'function': { args: [{ default: null, enums: null, name: 'value', type: ['string'] }], help: 'A unique identifier for the query within the list of targets. In server side expressions, the refId is used as a variable name to identify results. By default, the UI will assign A->Z; however setting meaningful names may be useful.' } },
  withRefId(value): {
    refId: value,
  },
}
