class SignupModel {
  String? email;
  String? name;
  String? phone;
  List<int>? languages;
  String? password;

  SignupModel(
      {this.email, this.name, this.phone, this.languages, this.password});

  SignupModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    phone = json['phone'];
    languages = json['languages'].cast<int>();
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['email'] = email;
    data['name'] = name;
    data['phone'] = phone;
    data['languages'] = languages;
    data['password'] = password;
    return data;
  }
}