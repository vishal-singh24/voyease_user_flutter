import 'package:json_annotation/json_annotation.dart';

part 'google_signup_model.g.dart';

@JsonSerializable()
class GoogleSignupModel {
  final String token;

  GoogleSignupModel({required this.token});

  factory GoogleSignupModel.fromJson(Map<String, dynamic> json) =>
      _$GoogleSignupModelFromJson(json);
}
