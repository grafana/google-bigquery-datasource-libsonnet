# bigquery

Jsonnet library for creating Bigquery queries for Grafana.
## Install

```
jb install github.com/grafana/google-bigquery-datasource-libsonnet/bigquery-query-libsonnet@main
```

## Usage

```jsonnet
local bigquery = import "github.com/grafana/google-bigquery-datasource-libsonnet/bigquery-query-libsonnet/main.libsonnet"
```


## Index

* [`fn withFormat(value)`](#fn-withformat)
* [`fn withHide(value=true)`](#fn-withhide)
* [`fn withKey(value)`](#fn-withkey)
* [`fn withQueryType(value)`](#fn-withquerytype)
* [`fn withRawSql(value)`](#fn-withrawsql)
* [`fn withRefId(value)`](#fn-withrefid)
* [`obj connectionArgs`](#obj-connectionargs)
  * [`fn withDataset(value)`](#fn-connectionargswithdataset)
  * [`fn withLocation(value)`](#fn-connectionargswithlocation)
  * [`fn withTable(value)`](#fn-connectionargswithtable)
* [`obj datasource`](#obj-datasource)
  * [`fn withType(value)`](#fn-datasourcewithtype)
  * [`fn withUid(value)`](#fn-datasourcewithuid)

## Fields

### fn withFormat

```jsonnet
withFormat(value)
```

PARAMETERS:

* **value** (`number`)
   - valid values: `0`, `1`


### fn withHide

```jsonnet
withHide(value=true)
```

PARAMETERS:

* **value** (`boolean`)
   - default value: `true`

true if query is disabled (ie should not be returned to the dashboard) Note this does not always imply that the query should not be executed since the results from a hidden query may be used as the input to other queries (SSE etc)
### fn withKey

```jsonnet
withKey(value)
```

PARAMETERS:

* **value** (`string`)

Unique, guid like, string (used only in explore mode)
### fn withQueryType

```jsonnet
withQueryType(value)
```

PARAMETERS:

* **value** (`string`)

Specify the query flavor TODO make this required and give it a default
### fn withRawSql

```jsonnet
withRawSql(value)
```

PARAMETERS:

* **value** (`string`)


### fn withRefId

```jsonnet
withRefId(value)
```

PARAMETERS:

* **value** (`string`)

A unique identifier for the query within the list of targets. In server side expressions, the refId is used as a variable name to identify results. By default, the UI will assign A->Z; however setting meaningful names may be useful.
### obj connectionArgs


#### fn connectionArgs.withDataset

```jsonnet
connectionArgs.withDataset(value)
```

PARAMETERS:

* **value** (`string`)


#### fn connectionArgs.withLocation

```jsonnet
connectionArgs.withLocation(value)
```

PARAMETERS:

* **value** (`string`)


#### fn connectionArgs.withTable

```jsonnet
connectionArgs.withTable(value)
```

PARAMETERS:

* **value** (`string`)


### obj datasource


#### fn datasource.withType

```jsonnet
datasource.withType(value)
```

PARAMETERS:

* **value** (`string`)

The plugin type-id
#### fn datasource.withUid

```jsonnet
datasource.withUid(value)
```

PARAMETERS:

* **value** (`string`)

Specific datasource instance