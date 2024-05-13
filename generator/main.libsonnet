local schema = import './schema.json';

local a = import 'github.com/crdsonnet/astsonnet/main.libsonnet';
local autils = import 'github.com/crdsonnet/astsonnet/utils.libsonnet';
local crdsonnet = import 'github.com/crdsonnet/crdsonnet/crdsonnet/main.libsonnet';
local astengine = import 'github.com/crdsonnet/crdsonnet/crdsonnet/renderEngines/ast.libsonnet';
local d = import 'github.com/jsonnet-libs/docsonnet/doc-util/main.libsonnet';

local processor =
  crdsonnet.processor.new()
  + crdsonnet.processor.withRenderEngineType('ast');


local unwrapFromCRDsonnet(astObject, title) =
  autils.get(
    astObject,
    title,
    default=error 'field %s not found in ast' % title
  ).expr;

local addDoc(obj) =
  a.object.new(
    [
      a.field.new(
        a.string.new('#'),
        // render docsonnet as literal to avoid docsonnet dependency
        a.literal.new(
          d.package.new(
            'bigquery',
            'github.com/grafana/google-bigquery-datasource-libsonnet/bigquery-query-libsonnet',
            'Jsonnet library for creating Bigquery queries for Grafana.',
            'main.libsonnet',
            'main',
          ),
        ),
      ),
    ]
    + std.filter(
      // '#' docstring replaced by above
      function(m) autils.fieldnameValue(m.fieldname) != '#',
      obj.members
    )
  );

local hideDocs(obj) =
  // The sub fields of these objects can be accessed directly.
  // For example: `connectionArgs.withDataset`
  local objFields = [
    'connectionArgs',
    'datasource',
  ];

  local docsToHide =
    std.map(
      function(f) '#%s' % astengine.functionName(f),
      objFields
    )
    + std.map(
      function(f) '#%sMixin' % astengine.functionName(f),
      objFields
    );

  a.object.new(
    std.filter(
      function(m)
        !std.member(
          docsToHide,
          autils.fieldnameValue(m.fieldname)
        ),
      obj.members,
    )
  );

local render = crdsonnet.schema.render('item', schema, processor);

local unwrapped = unwrapFromCRDsonnet(render, 'item');

local renderWithDoc = addDoc(unwrapped);

local renderWithHiddenDocs = hideDocs(renderWithDoc);

renderWithHiddenDocs.toString()
