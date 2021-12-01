import 'dart:convert';

import 'package:demo_hospital/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

enum Status {
  NotLoggedIn,
  NotRegistered,
  LoggedIn,
  Registered,
  Authenticating,
  Registering,
  LoggedOut
}

abstract class UserSession {
  //Establish connection
  static final String url = 'http://myteethdh-002-site3.itempurl.com';
  // UserSession({required this.url});

  //user register
  static Future<void> userRegister(UserRegister user,
      {required Function onSuccessful}) async {
    final response = await http.post(
        Uri.parse(url + '/api/Accounts/CreateAccount'),
        body: userRegisterToJson(user),
        headers: {"Content-Type": "application/json"});
    if (response.statusCode == 200) {
      onSuccessful();
      // return "user with name ${User.fromJson(jsonDecode(response.body)).fulllName} successfully registered";
    } else {
      throw Exception('Failed to register user');
    }
  }

  //user login
  static Future<void> userLogin(UserLogin user,
      {required Function onSuccessful}) async {
    //print(userLoginToJson(user));
    final response = await http.post(Uri.parse(url + '/api/Accounts/SignIn'),
        body: userLoginToJson(user),
        headers: {"Content-Type": "application/json"});
    //print(response.body);

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String username = user.userName;
    String pass = user.password;
    print(UserResponse.fromJson(jsonDecode(response.body)).token);
    String token = UserResponse.fromJson(jsonDecode(response.body)).token;
    if (response.statusCode == 200) {
      await prefs.setString('token', token);
      await prefs.setString('pass', pass);
      await prefs.setString('username', username);
      print(prefs.getString('token'));
      onSuccessful();
      //return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to logging in');
    }
  }

  //user logout
  Future<void> userLogout(User user, {required Function onLogout}) async {
    final response = await http.post(Uri.parse(url + '/api/Accounts/Logout'));
    if (response.statusCode == 200) {
      onLogout();
      //return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to logging in');
    }
  }

  //get current user
  static Future<Status> checkCurrentUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? username = prefs.getString('username');
    String? token = prefs.getString('token');
    String? pass = prefs.getString('pass');
    if (username == null || pass == null) {
      return Status.NotLoggedIn;
    } else {
      print('here');
      var user = UserLogin(userName: username, password: pass);

      final response = await http.post(Uri.parse(url + '/api/Accounts/SignIn'),
          body: userLoginToJson(user),
          headers: {"Content-Type": "application/json"});

      String token = UserResponse.fromJson(jsonDecode(response.body)).token;
      if (response.statusCode == 200) {
        // print(response.body.runtimeType);
        //onSuccessful();
        //return User.fromJson(jsonDecode(response.body));
        return Status.LoggedIn;
      } else {
        throw Exception('Failed to logging in');
      }
    }
  }
}
