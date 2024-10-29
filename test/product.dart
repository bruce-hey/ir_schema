// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());


///A product from Acme's catalog
class Product {
    final Dimensions dimensions;
    
    ///The price of the product
    final double price;
    
    ///The unique identifier for a product
    final int productId;
    
    ///Name of the product
    final String productName;
    
    ///Tags for the product
    final List<String> tags;

    Product({
        required this.dimensions,
        required this.price,
        required this.productId,
        required this.productName,
        required this.tags,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        dimensions: Dimensions.fromJson(json["dimensions"]),
        price: json["price"]?.toDouble(),
        productId: json["productId"],
        productName: json["productName"],
        tags: List<String>.from(json["tags"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "dimensions": dimensions.toJson(),
        "price": price,
        "productId": productId,
        "productName": productName,
        "tags": List<dynamic>.from(tags.map((x) => x)),
    };
}

class Dimensions {
    final double height;
    final double length;
    final double width;

    Dimensions({
        required this.height,
        required this.length,
        required this.width,
    });

    factory Dimensions.fromJson(Map<String, dynamic> json) => Dimensions(
        height: json["height"]?.toDouble(),
        length: json["length"]?.toDouble(),
        width: json["width"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "height": height,
        "length": length,
        "width": width,
    };
}
