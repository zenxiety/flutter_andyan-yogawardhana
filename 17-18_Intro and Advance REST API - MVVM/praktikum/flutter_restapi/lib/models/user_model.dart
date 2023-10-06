class UserModel {
  String? name;
  String? job;
  String? id;
  String? created;

  UserModel({this.name, this.job, this.id, this.created});

  UserModel.fromJSON(Map<String, dynamic> json) {
    name = json['name'];
    job = json['job'];
    id = json['id'];
    created = json['createdAt'];
  }

  Map<String, dynamic> toJSON() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['name'] = name;
    data['job'] = job;
    data['id'] = id;
    data['created'] = created;

    return data;
  }
}
