class OrderEntity {
  String? id;
  String? name;
  String? image;
  String? note;
  String? orderType;


  OrderEntity({
    this.id,
    this.name,
    this.image,
    this.note,
    this.orderType,
  });

  OrderEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    note = json['note'];
    orderType = json['order_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['note'] = note;
    data['order_type'] = orderType;
    return data;
  }
}
