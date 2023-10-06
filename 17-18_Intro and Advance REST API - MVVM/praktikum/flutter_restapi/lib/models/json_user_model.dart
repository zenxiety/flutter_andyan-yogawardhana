class JsonUserModel {
  int? id;
  String? name;
  String? phone;

  JsonUserModel({this.id, this.name, this.phone});

  JsonUserModel.fromJSON(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJSON() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = id;
    data['name'] = name;
    data['phone'] = phone;

    return data;
  }
}
