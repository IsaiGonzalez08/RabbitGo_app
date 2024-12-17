/* import 'package:json_annotation/json_annotation.dart';

part 'sign_in_response.g.dart';

@JsonSerializable()
class SignInResponse {
  final String id;
  final String token;
  final String type;
  final bool? voluntary;

  SignInResponse(this.token, this.id, this.type, this.voluntary);

  factory SignInResponse.fromJson(Map<String, dynamic> json) =>
      _$SignInResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SignInResponseToJson(this);

  UserType get userType {
    switch (type) {
      case "user":
        return UserType.user;
      case "instructor":
        return UserType.instructor;
      default:
        return UserType.user;
    }
  }
}
 */