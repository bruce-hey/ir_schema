import 'dart:convert';

class Module {
    final String? author;
    final double height;
    final String moduleId;
    final String? name;
    final List<Page> pages;
    final int slideCount;
    final String? title;
    final double width;

    Module({
        this.author,
        required this.height,
        required this.moduleId,
        this.name,
        required this.pages,
        required this.slideCount,
        this.title,
        required this.width,
    });

    factory Module.fromRawJson(String str) => Module.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Module.fromJson(Map<String, dynamic> json) => Module(
        author: json["author"],
        height: json["height"]?.toDouble(),
        moduleId: json["moduleId"],
        name: json["name"],
        pages: List<Page>.from(json["pages"].map((x) => Page.fromJson(x))),
        slideCount: json["slideCount"],
        title: json["title"],
        width: json["width"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "author": author,
        "height": height,
        "moduleId": moduleId,
        "name": name,
        "pages": List<dynamic>.from(pages.map((x) => x.toJson())),
        "slideCount": slideCount,
        "title": title,
        "width": width,
    };
}

class Page {
    final List<Component>? components;
    final String? slideId;

    Page({
        this.components,
        this.slideId,
    });

    factory Page.fromRawJson(String str) => Page.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Page.fromJson(Map<String, dynamic> json) => Page(
        components: json["components"] == null ? [] : List<Component>.from(json["components"]!.map((x) => Component.fromJson(x))),
        slideId: json["slideId"],
    );

    Map<String, dynamic> toJson() => {
        "components": components == null ? [] : List<dynamic>.from(components!.map((x) => x.toJson())),
        "slideId": slideId,
    };
}

class Component {
    final String? content;
    final ComponentType componentType;
    final double height;
    final double width;
    final double x;
    final double y;
    final String? imageFile;

    Component({
        this.content,
        required this.componentType,
        required this.height,
        required this.width,
        required this.x,
        required this.y,
        this.imageFile,
    });

    factory Component.fromRawJson(String str) => Component.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Component.fromJson(Map<String, dynamic> json) => Component(
        content: json["content"],
        componentType: componentTypeValues.map[json["componentType"]]!,
        height: json["height"]?.toDouble(),
        width: json["width"]?.toDouble(),
        x: json["x"]?.toDouble(),
        y: json["y"]?.toDouble(),
        imageFile: json["imageFile"],
    );

    Map<String, dynamic> toJson() => {
        "content": content,
        "componentType": componentTypeValues.reverse[componentType],
        "height": height,
        "width": width,
        "x": x,
        "y": y,
        "imageFile": imageFile,
    };
}

enum ComponentType {
    IMAGE,
    TEXT
}

final componentTypeValues = EnumValues({
    "image": ComponentType.IMAGE,
    "text": ComponentType.TEXT
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
