// To parse this JSON data, do
//
//     final ir = irFromJson(jsonString);

import 'dart:convert';

Ir irFromJson(String str) => Ir.fromJson(json.decode(str));

String irToJson(Ir data) => json.encode(data.toJson());


///Luna module definition
class Ir {
    
    ///module author name
    String? author;
    
    ///module title
    String? title;

    Ir({
        this.author,
        this.title,
    });

    factory Ir.fromJson(Map<String, dynamic> json) => Ir(
        author: json["author"],
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "author": author,
        "title": title,
    };
}
