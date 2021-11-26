import 'package:demo_hospital/models/user.dart';
import 'package:http/http.dart' as http;

class UserSession {
  //Establish connection
  final String url;
  UserSession({required this.url});

  //user register
  Future<void> userRegister(User user, {required Function onSuccessful}) async {
    final response = await http.post(
        Uri.parse(url + '/api/Accounts/CreateAccount'),
        body: userToJson(user),
        headers: {"Content-Type": "application/json"});
    if (response.statusCode == 200) {
      onSuccessful();
      // return "user with name ${User.fromJson(jsonDecode(response.body)).fulllName} successfully registered";
    } else {
      throw Exception('Failed to register user');
    }
  }

  //user login
  Future<void> userLogin(User user, {required Function onSuccessful}) async {
    print(userToLoginJson(user));
    final response = await http.post(Uri.parse(url + '/api/Accounts/SignIn'),
        body: userToLoginJson(user),
        headers: {"Content-Type": "application/json"});
    print(response.body);
    if (response.statusCode == 200) {
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
  Future<void> getUser(User user, {required Function onSuccessful}) async {
    final response = await http.post(Uri.parse(url + '/api/Accounts/Logout'));
    if (response.statusCode == 200) {
      onSuccessful();
      //return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to logging in');
    }
  }
}
