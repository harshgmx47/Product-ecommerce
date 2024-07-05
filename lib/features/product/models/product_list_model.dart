// To parse this JSON data, do
//
//     final productSDataModel = productSDataModelFromJson(jsonString);

import 'dart:convert';

List<ProductSDataModel> productSDataModelFromJson(String str) =>
    List<ProductSDataModel>.from(
        json.decode(str).map((x) => ProductSDataModel.fromJson(x)));

String productSDataModelToJson(List<ProductSDataModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductSDataModel {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;
  bool isFavorite;

  ProductSDataModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
    this.isFavorite = false,
  });

  ProductSDataModel copyWith({
    int? id,
    String? title,
    double? price,
    String? description,
    String? category,
    String? image,
    Rating? rating,
    bool? isFavorite,
  }) =>
      ProductSDataModel(
        id: id ?? this.id,
        title: title ?? this.title,
        price: price ?? this.price,
        description: description ?? this.description,
        category: category ?? this.category,
        image: image ?? this.image,
        rating: rating ?? this.rating,
        isFavorite: isFavorite ?? this.isFavorite,
      );

  factory ProductSDataModel.fromJson(Map<String, dynamic> json) =>
      ProductSDataModel(
        id: json["id"],
        title: json["title"],
        price: json["price"]?.toDouble(),
        description: json["description"],
        category: json["category"],
        image: json["image"],
        rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
        isFavorite: json["isFavorite"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": category,
        "image": image,
        "rating": rating?.toJson(),
        "isFavorite": isFavorite,
      };
}

class Rating {
  double? rate;
  int? count;

  Rating({
    this.rate,
    this.count,
  });

  Rating copyWith({
    double? rate,
    int? count,
  }) =>
      Rating(
        rate: rate ?? this.rate,
        count: count ?? this.count,
      );

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rate: json["rate"]?.toDouble(),
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "rate": rate,
        "count": count,
      };
}
