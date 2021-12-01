// import 'dart:async';
//
// import 'package:demo_hospital/models/user.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class UserPreferences {
//   Future<bool> saveUser(User user) async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//
//     prefs.setString("name", user.fulllName ?? 'no name');
//     prefs.setString("email", user.email ?? 'no email');
//     prefs.setString("phone", user.mobile ?? 'no phone');
//     prefs.setString("token", user.token ?? 'no token');
//
//     return prefs.commit();
//   }
//
//   Future<User> getUserByEmail() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//
//     String? pass = prefs.getString("pass");
//     String? email = prefs.getString("email");
//     String? token = prefs.getString("token");
//
//     return User.loginWithEmail(token, email: email, password: pass);
//   }
//
//   Future<User> getUserByPhone() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//
//     String? pass = prefs.getString("pass");
//     String? phone = prefs.getString("phone");
//     String? token = prefs.getString("token");
//
//     return User.loginWithPhone(token, mobile: phone, password: pass);
//   }
//
//   void removeUser() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//
//     prefs.remove("name");
//     prefs.remove("email");
//     prefs.remove("phone");
//     prefs.remove("token");
//   }
//
//   Future<String> getToken() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     String token = prefs.getString("token") ?? 'no token';
//     return token;
//   }
// }
