// To parse this JSON data, do
//
//     final productsModel = productsModelFromJson(jsonString);

import 'dart:convert';

List<ProductsModel> productsModelFromJson(String str) => List<ProductsModel>.from(json.decode(str).map((x) => ProductsModel.fromJson(x)));

String productsModelToJson(List<ProductsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductsModel {
    ProductsModel({
        this.id,
        this.title,
        this.price,
        this.description,
        this.category,
        this.images,
        this.categoryId,
    });

    int? id;
    String? title;
    double? price;
    String? description;
    Category? category;
    List<String>? images;
    int? categoryId;

    factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
        id: json["id"],
        title: json["title"],
        price: json["price"].toDouble(),
        description: json["description"],
        category: Category.fromJson(json["category"]),
        images: List<String>.from(json["images"].map((x) => x)),
        categoryId: json["categoryId"] == null ? null : json["categoryId"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": category!.toJson(),
        "images": List<dynamic>.from(images!.map((x) => x)),
        "categoryId": categoryId == null ? null : categoryId,
    };
}

class Category {
    Category({
        this.id,
        this.name,
        this.image,
        this.keyLoremSpace,
    });

    int? id;
    Name? name;
    String? image;
    KeyLoremSpace? keyLoremSpace;

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: nameValues.map[json["name"]],
        image: json["image"],
        keyLoremSpace: json["keyLoremSpace"] == null ? null : keyLoremSpaceValues.map[json["keyLoremSpace"]],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": nameValues.reverse[name],
        "image": image,
        "keyLoremSpace": keyLoremSpace == null ? null : keyLoremSpaceValues.reverse[keyLoremSpace],
    };
}

enum KeyLoremSpace { FASHION, WATCH }

final keyLoremSpaceValues = EnumValues({
    "fashion": KeyLoremSpace.FASHION,
    "watch": KeyLoremSpace.WATCH
});

enum Name { OTHERS, SHOES, CLOTHES, ELECTRONICS, FURNITURE }

final nameValues = EnumValues({
    "Clothes": Name.CLOTHES,
    "Electronics": Name.ELECTRONICS,
    "Furniture": Name.FURNITURE,
    "Others": Name.OTHERS,
    "Shoes": Name.SHOES
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String>? reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap!;
    }
}
