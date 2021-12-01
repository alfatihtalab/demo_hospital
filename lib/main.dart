import 'package:demo_hospital/api/services/user_auth.dart';
import 'package:demo_hospital/screens/auth/login.dart';
import 'package:demo_hospital/screens/home/home_dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

/*
 * in the class SplashScreen must check the user
 * if user logged in go to the main screen
 * else go to login screen
 *
 */
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  //final UserSession _userSession = UserSession(url: mURL);

  @override
  void initState() {
    // TODO: implement initState
    getCurrentUser();
    super.initState();
  }

  Future<void> getCurrentUser() async {
    // _userSession.userLogin(user, onSuccessful: () {
    //   Navigator.push(context, MaterialPageRoute(builder: (context) {
    //     return const DashboardPage();
    //   }));
    // });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: UserSession.checkCurrentUser(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data == Status.LoggedIn) {
              return const DashboardPage();
            }
            if (snapshot.data == Status.NotLoggedIn) {
              return const LoginPage();
            }
          } else if (snapshot.hasError) {
            return const Scaffold(
              body: SafeArea(
                child: Center(
                  child: Image(
                    image: AssetImage('assets/doctor_t.png'),
                  ),
                ),
              ),
            );
          }
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
