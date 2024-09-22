class UserProfileModel {
  int? id;
  String? name;
  String? email;
  bool? emailVerified;
  String? phone;
  bool? phoneVerified;
  String? dob;
  String? profile;
  List<Languages>? languages;
  String? gender;
  String? createdAt;
  String? updatedAt;

  UserProfileModel(
      {this.id,
      this.name,
      this.email,
      this.emailVerified,
      this.phone,
      this.phoneVerified,
      this.dob,
      this.profile,
      this.languages,
      this.gender,
      this.createdAt,
      this.updatedAt});

  UserProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerified = json['emailVerified'];
    phone = json['phone'];
    phoneVerified = json['phoneVerified'];
    dob = json['dob'];
    if (json['languages'] != null) {
      languages = <Languages>[];
      json['languages'].forEach((v) {
        languages!.add( Languages.fromJson(v));
      });
    }
    gender = json['gender'];
    profile=json['profile'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['emailVerified'] = emailVerified;
    data['phone'] = phone;
    data['phoneVerified'] = phoneVerified;
    data['dob'] = dob;
    if (languages != null) {
      data['languages'] = languages!.map((v) => v.toJson()).toList();
    }
    data['gender'] = gender;
    data['profile']=profile;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class Languages {
  int? id;
  String? value;

  Languages({this.id, this.value});

  Languages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final data =  <String, dynamic>{};
    data['id'] = id;
    data['value'] = value;
    return data;
  }
}