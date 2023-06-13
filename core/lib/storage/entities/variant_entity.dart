class VariantEntity {
  String? id;
  String? name;
  String? itemId;

  VariantEntity({
    this.id,
    this.name,
    this.itemId,
  });

  VariantEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    itemId = json['item_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['item_id'] = itemId;
    return data;
  }
}



class TimeSlotsEntity {
  String? id;
  String? name;
  String? itemId;

  TimeSlotsEntity({
    this.id,
    this.name,
    this.itemId,
  });

  TimeSlotsEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    itemId = json['item_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['item_id'] = itemId;
    return data;
  }
}
