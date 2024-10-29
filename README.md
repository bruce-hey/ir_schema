# ir_schema
## Luna IR schema prototype


Uses [quicktype](https://quicktype.io) to create Dart data objects from a [JSON schema](https://json-schema.org).

Prototype [schema](https://github.com/bruce-hey/ir_schema/blob/main/lib/model/schema/ir_schema.yaml) in lib/model/schema is converted from YAML to JSON since
native Dart validation code requires JSON:

```
$ yq ir_schema.yaml -o json > ir_schema.json
```

Quicktype is then used to generate the data model object code:

```
$ quicktype -s schema -t Module --final-props --coders-in-class -o lib/model/ir_model.dart lib/model/schema/ir_schema.yaml
```

A couple of simple code snippets illustrate object creation:

```
$ dart run lib/parser.dart
module: {author: Chester Alan Author, height: 100.0, moduleId: module01, name: fred, pages: [{components: [{content: my text, componentType: text, height: 0.0, width: 0.0, x: 0.0, y: 0.0, imageFile: null}, {content: null, componentType: image, height: 10.0, width: 10.0, x: 10.0, y: 10.0, imageFile: foo.jpg}], slideId: slide001}], slideCount: 1, title: a title, width: 200.0}

VALID

```

and data validation:

```
$ dart run lib/validate.dart
VALID
```
