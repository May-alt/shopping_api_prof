class LoginModel {
  late bool status;
  late String message;
  late UserInfoData? data;

  LoginModel({required this.status, required this.message, required this.data});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ?  UserInfoData.fromJson(json['data']) : null;
    // data = UserInfoData.fromJson(json['data']) ??null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }

}

class UserInfoData {
  late int id;
  late String name;
  late String email;
  late dynamic phone;
  late String image;
  late int points;
  late int credit;
  late String token;

  UserInfoData({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
    required this.points,
    required this.credit,
    required this.token,
  });

  //named Constaractor
  UserInfoData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    points = json['points'];
    credit = json['credit'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['points'] = this.points;
    data['credit'] = this.credit;
    return data;
  }

}

