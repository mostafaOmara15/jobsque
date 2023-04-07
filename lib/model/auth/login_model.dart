class LoginModel {
  User? user;
  String? token;
  bool? status;

  LoginModel({this.user, this.token, this.status});

  LoginModel.fromJson(Map<String, dynamic> json) {
    user = json['\$user'] != null ? User.fromJson(json['\$user']) : null;
    token = json['token'];
    status = json['status'];
  }
}

class User {
  int? id;
  String? name;
  String? otp;
  // Null? towStep;
  String? email;
  // String? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;

  User(
      {
        this.id,
        this.name,
        this.otp,
        // this.towStep,
        this.email,
        // this.emailVerifiedAt,
        this.createdAt,
        this.updatedAt
      }
  );

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    otp = json['otp'];
    // towStep = json['tow_step'];
    email = json['email'];
    // emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}