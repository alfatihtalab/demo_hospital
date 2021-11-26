// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

String userToLoginJson(User data) => json.encode(data.toLoginJson());

class User {
  User({
    required this.email,
    required this.fulllName,
    required this.password,
    required this.mobile,
    required this.userType,
    required this.requestType,
    required this.organizationId,
  });

  String email;
  String fulllName;
  String password;
  String mobile;
  String userType;
  String requestType;
  int organizationId;

  factory User.fromJson(Map<String, dynamic> json) => User(
        email: json["email"],
        fulllName: json["fulllName"],
        password: json["password"],
        mobile: json["mobile"],
        userType: json["userType"],
        requestType: json["requestType"],
        organizationId: json["organizationId"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "fulllName": fulllName,
        "password": password,
        "mobile": mobile,
        "userType": userType,
        "requestType": requestType,
        "organizationId": organizationId,
      };
  Map<String, dynamic> toLoginJson() => {
        "userName": email,
        "password": password,
      };
}
