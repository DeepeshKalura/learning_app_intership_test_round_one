class ProgramModel {
  String? requestId;
  List<Items>? items;
  int? count;
  String? anyKey;

  ProgramModel({this.requestId, this.items, this.count, this.anyKey});

  ProgramModel.fromJson(Map<String, dynamic> json) {
    requestId = json['requestId'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
    count = json['count'];
    anyKey = json['anyKey'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['requestId'] = requestId;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    data['count'] = count;
    data['anyKey'] = anyKey;
    return data;
  }
}

class Items {
  String? createdAt;
  String? name;
  String? category;
  int? lesson;
  String? id;

  Items({this.createdAt, this.name, this.category, this.lesson, this.id});

  Items.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    name = json['name'];
    category = json['category'];
    lesson = json['lesson'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['createdAt'] = createdAt;
    data['name'] = name;
    data['category'] = category;
    data['lesson'] = lesson;
    data['id'] = id;
    return data;
  }
}
