import "model/schema/ir_schema.dart";
import "dart:io";
import 'package:json_schema/json_schema.dart';

Module createModule() {
  Component textComponent = Component(
      componentType: ComponentType.TEXT,
      height: 0,
      width: 0,
      x: 0,
      y: 0,
      content: 'my text');
  Component imageCompoonent = Component(
      componentType: ComponentType.IMAGE,
      height: 10,
      width: 10,
      x: 10,
      y: 10,
      imageFile: 'foo.jpg');
  List<Component> components = [textComponent, imageCompoonent];
  Page page = Page(components: components, slideId: "slide001");
  List<Page> pages = [page];
  return Module(
      height: 100,
      moduleId: 'module01',
      pages: pages,
      slideCount: 1,
      width: 200,
      name: 'fred',
      title: 'a title',
      author: 'Chester Alan Author');
}

void main() {
  Module m = createModule();
  var moduleJson = m.toJson();
  print('module: $moduleJson');
  print('');
  var schemaData = File('./lib/model/schema/ir_schema.json').readAsStringSync();
  var schema = JsonSchema.create(schemaData);
  print('validate: ${schema.validate(moduleJson)}');
}
