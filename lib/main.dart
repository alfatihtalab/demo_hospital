import 'package:demo_hospital/models/user.dart';
import 'package:demo_hospital/screens/auth/login.dart';
import 'package:demo_hospital/screens/home/home_dashboard.dart';
import 'package:demo_hospital/services/user_auth.dart';
import 'package:demo_hospital/utilits.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      home: const LoginPage(),
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
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final UserSession _userSession = UserSession(url: mURL);
  User user = User(
      email: 'alfatih@example.com',
      fulllName: 'alfatih',
      password: 'Az123456789',
      mobile: '09123456789',
      userType: 'string',
      requestType: 'string',
      organizationId: 0);
  @override
  void initState() {
    // TODO: implement initState
    getCurrentUser();
    super.initState();
  }

  Future<void> getCurrentUser() async {
    _userSession.userLogin(user, onSuccessful: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const DashboardPage();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Image(
            width: 250,
            height: 400,
            image: AssetImage('assets/doctor_t.png'),
          ),
        ),
      ),
    );
  }
}
