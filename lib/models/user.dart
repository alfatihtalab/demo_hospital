// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

//String userToLoginJson(User data) => json.encode(data.toLoginJson());

class User {
  User.register(
      {required this.email,
      required this.fulllName,
      required this.password,
      required this.mobile,
      required this.userType,
      required this.requestType,
      required this.organizationId});
  // User.login(
  //     {required this.token, required this.username, required this.password});
  // User.loginWithEmail(
  //     {required this.token,
  //     required this.email,
  //     required this.password,
  //     required this.username});
  // User.loginWithPhone(
  //     {required this.token,
  //     required this.mobile,
  //     required this.password,
  //     required this.username});

  String email;
  String fulllName;
  String password;
  String mobile;
  String userType;
  String requestType;
  int organizationId;

  factory User.fromJson(Map<String, dynamic> json) => User.register(
      email: json["email"],
      fulllName: json["fulllName"],
      password: json["password"],
      mobile: json["mobile"],
      userType: json["userType"],
      requestType: json["requestType"],
      organizationId: json["organizationId"]);

  Map<String, dynamic> toJson() => {
        "email": email,
        "fulllName": fulllName,
        "password": password,
        "mobile": mobile,
        "userType": userType,
        "requestType": requestType,
        "organizationId": organizationId,
      };
  Map<String, dynamic> toLoginJson() =>
      {"userName": email, "password": password};
}

UserLogin userLoginFromJson(String str) => UserLogin.fromJson(json.decode(str));

String userLoginToJson(UserLogin data) => json.encode(data.toJson());

class UserLogin {
  UserLogin({
    required this.userName,
    required this.password,
  });

  String userName;
  String password;

  factory UserLogin.fromJson(Map<String, dynamic> json) => UserLogin(
        userName: json["userName"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "userName": userName,
        "password": password,
      };
}

// To parse this JSON data, do
//
//     final userResponse = userResponseFromJson(jsonString);

UserResponse userResponseFromJson(String str) =>
    UserResponse.fromJson(json.decode(str));

String userResponseToJson(UserResponse data) => json.encode(data.toJson());

class UserResponse {
  UserResponse({
    required this.userId,
    required this.email,
    required this.name,
    required this.organizationId,
    required this.roles,
    required this.token,
    this.message,
    required this.success,
    required this.validationErrors,
  });

  String userId;
  String email;
  String name;
  int organizationId;
  List<dynamic> roles;
  String token;
  dynamic message;
  bool success;
  List<dynamic> validationErrors;

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
        userId: json["userId"],
        email: json["email"],
        name: json["name"],
        organizationId: json["organizationId"],
        roles: List<dynamic>.from(json["roles"].map((x) => x)),
        token: json["token"],
        message: json["message"],
        success: json["success"],
        validationErrors:
            List<dynamic>.from(json["validationErrors"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "email": email,
        "name": name,
        "organizationId": organizationId,
        "roles": List<dynamic>.from(roles.map((x) => x)),
        "token": token,
        "message": message,
        "success": success,
        "validationErrors": List<dynamic>.from(validationErrors.map((x) => x)),
      };
}

// To parse this JSON data, do
//
//     final userRegister = userRegisterFromJson(jsonString);

UserRegister userRegisterFromJson(String str) =>
    UserRegister.fromJson(json.decode(str));

String userRegisterToJson(UserRegister data) => json.encode(data.toJson());

class UserRegister {
  UserRegister({
    required this.email,
    required this.fulllName,
    required this.password,
    required this.mobile,
    this.userType = '',
    this.requestType = '',
    this.organizationId = 0,
  });

  String email;
  String fulllName;
  String password;
  String mobile;
  String userType;
  String requestType;
  int organizationId;

  factory UserRegister.fromJson(Map<String, dynamic> json) => UserRegister(
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
}
