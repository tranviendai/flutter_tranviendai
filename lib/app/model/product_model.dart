import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));


class ProductModel {
    List<Shoe>? shoes;

    ProductModel({
        this.shoes,
    });

    factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        shoes: json["shoes"] == null ? [] : List<Shoe>.from(json["shoes"]!.map((x) => Shoe.fromJson(x))),
    );
}

class Shoe {
    int? id;
    String? image;
    String? name;
    String? description;
    double? price;
    String? color;
    int quantity;
    bool? filled;

    Shoe({
        this.id,
        this.image,
        this.name,
        this.description,
        this.price,
        this.color,
        this.quantity = 0,
        this.filled = false
    });

    factory Shoe.fromJson(Map<String, dynamic> json) => Shoe(
        id: json["id"],
        image: json["image"],
        name: json["name"],
        description: json["description"],
        price: json["price"]?.toDouble(),
        color: json["color"],
    );

}
