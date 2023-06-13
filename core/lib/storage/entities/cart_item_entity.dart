class CartItemEntity {
  String? id;

  String? name;

  String? image;

  int? count;

  String? price;

  int? shippingFees;

  String? date;

  // String? timeSlot;
  // List<String>? timeSlot;

  String? note;
  int? hasCount;

  CartItemEntity({
    this.id,
    this.name,
    this.image,
    this.count,
    this.price,
    this.shippingFees,
    this.date,
    // this.timeSlot,
    this.note,
    this.hasCount,
  });

  CartItemEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    count = json['count'];
    price = json['price'];
    shippingFees = json['shipping_fees'];
    date = json['date'];
    // timeSlot = json['time_slot'].cast<String>();
    note = json['note'];
    hasCount = json['hasCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['count'] = count;
    data['price'] = price;
    data['shipping_fees'] = shippingFees;
    data['date'] = date;
    // data['time_slot'] = timeSlot;
    data['note'] = note;
    data['hasCount'] = hasCount;
    return data;
  }
}
