// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// enum Status {
//   NotLoggedIn,
//   NotRegistered,
//   LoggedIn,
//   Registered,
//   Authenticating,
//   Registering,
//   LoggedOut
// }
// //provider for splash screen
// //check user is logged in before and the token is active (){ }
// //when user logged in save response in shared prefernce
// //user close app then opened it again
// //get user data from shared_prefernce and check the user
//
// //if go to dashboard screen
// //else go to login screen
// class UserManger extends ChangeNotifier {
//   Status _loggedInStatus = Status.NotLoggedIn;
//   Status _registeredInStatus = Status.NotRegistered;
//
//   Status get loggedInStatus => _loggedInStatus;
//   Status get registeredInStatus => _registeredInStatus;
//
//   checkUserLogin() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//   }
//
//   userLogin() {}
//
//   userLoggedIn() {}
//
//   userRegistered() {}
//
//   userLoggedOut() {}
// }
