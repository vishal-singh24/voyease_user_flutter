import 'package:json_annotation/json_annotation.dart';

part 'google_login_model.g.dart';

@JsonSerializable()
class GoogleLoginModel {
  final String token;

  GoogleLoginModel({required this.token});

  Map<String, dynamic> toJson() => _$GoogleLoginModelToJson(this);
  // factory GoogleLoginModel.fromJson(Map<String, dynamic> json) =>
  //     _$GoogleLoginModelFromJson(json);
}
