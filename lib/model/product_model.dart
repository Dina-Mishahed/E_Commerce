class ProductModel {
  String? name, image, description, color, price, size;

  ProductModel(this.name, this.image, this.description, this.color, this.price,
      this.size);

  ProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    name = map['name'];
    image = map['image'];
    description = map['description'];
    color = map['color'];
    price = map['price'];
    size = map['size'];
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'description': description,
      'color': color,
      'price': price,
      'size': size,
    };
  }
}
