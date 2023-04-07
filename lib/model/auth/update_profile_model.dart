class UpdateProfileModel {
  bool? status;
  Data? data;

  UpdateProfileModel({this.status, this.data});

  UpdateProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  int? userId;
  String? name;
  String? email;
  String? mobile;
  String? address;
  String? language;
  String? interstedWork;
  String? offlinePlace;
  String? remotePlace;
  String? bio;
  String? educationId;
  String? experience;
  String? personalDetailes;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.userId,
        this.name,
        this.email,
        this.mobile,
        this.address,
        this.language,
        this.interstedWork,
        this.offlinePlace,
        this.remotePlace,
        this.bio,
        this.educationId,
        this.experience,
        this.personalDetailes,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    address = json['address'];
    language = json['language'];
    interstedWork = json['intersted_work'];
    offlinePlace = json['offline_place'];
    remotePlace = json['remote_place'];
    bio = json['bio'];
    educationId = json['education_id'];
    experience = json['experience'];
    personalDetailes = json['personal detailes'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['address'] = this.address;
    data['language'] = this.language;
    data['intersted_work'] = this.interstedWork;
    data['offline_place'] = this.offlinePlace;
    data['remote_place'] = this.remotePlace;
    data['bio'] = this.bio;
    data['education_id'] = this.educationId;
    data['experience'] = this.experience;
    data['personal detailes'] = this.personalDetailes;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}