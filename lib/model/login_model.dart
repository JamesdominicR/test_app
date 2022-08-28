import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    LoginModel({
        required this.token,
    });

    String token;

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "token": token,
    };
}