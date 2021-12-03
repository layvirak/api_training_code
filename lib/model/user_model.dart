class UserModel {
  List<Data>? data;
  Links? links;
  Meta? meta;

  UserModel({this.data, this.links, this.meta});

  UserModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   if (this.data != null) {
  //     data['data'] = this.data!.map((v) => v.toJson()).toList();
  //   }
  //   if (this.links != null) {
  //     data['links'] = this.links!.toJson();
  //   }
  //   if (this.meta != null) {
  //     data['meta'] = this.meta!.toJson();
  //   }
  //   return data;
  // }
}

class Data {
  int? id;
  String? firstName;
  String? lastName;
  String? age;
  String? activeDate;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.firstName,
      this.lastName,
      this.age,
      this.activeDate,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    age = json['age'];
    activeDate = json['active_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['first_name'] = this.firstName;
  //   data['last_name'] = this.lastName;
  //   data['age'] = this.age;
  //   data['active_date'] = this.activeDate;
  //   data['created_at'] = this.createdAt;
  //   data['updated_at'] = this.updatedAt;
  //   return data;
  // }
}

class Links {
  String? first;
  String? last;
  String? prev;
  String? next;

  Links({this.first, this.last, this.prev, this.next});

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
    prev = json['prev'];
    next = json['next'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['first'] = this.first;
  //   data['last'] = this.last;
  //   data['prev'] = this.prev;
  //   data['next'] = this.next;
  //   return data;
  // }
}

class Meta {
  int? currentPage;
  int? from;
  int? lastPage;
  String? path;
  int? perPage;
  int? to;
  int? total;

  Meta(
      {this.currentPage,
      this.from,
      this.lastPage,
      this.path,
      this.perPage,
      this.to,
      this.total});

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    from = json['from'];
    lastPage = json['last_page'];
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['current_page'] = this.currentPage;
  //   data['from'] = this.from;
  //   data['last_page'] = this.lastPage;
  //   data['path'] = this.path;
  //   data['per_page'] = this.perPage;
  //   data['to'] = this.to;
  //   data['total'] = this.total;
  //   return data;
  // }
}
