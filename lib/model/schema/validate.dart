import 'dart:convert';

import 'package:json_schema/json_schema.dart';
import 'dart:io';

void main() {
  final schemaData =
      File('./lib/model/schema/ir_schema.json').readAsStringSync();
  final jsonStr = File('./lib/model/schema/test_data.json').readAsStringSync();
  final json = jsonDecode(jsonStr);

  final schema = JsonSchema.create(schemaData);
  print('${schema.validate(json)}');
}
