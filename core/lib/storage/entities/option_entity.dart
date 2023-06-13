class OptionEntity {
  String? id;
  String? name;
  String? price;
  String? variantId;

  OptionEntity({
    this.id,
    this.name,
    this.price,
    this.variantId,
  });

  OptionEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    variantId = json['variants_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['variants_id'] = variantId;
    return data;
  }
}
