import 'dart:async';

import 'package:demo_hospital/screens/auth/forget.dart';
import 'package:demo_hospital/screens/auth/register.dart';
import 'package:demo_hospital/screens/home/home_dashboard.dart';
import 'package:flutter/material.dart';

import '../../utilits.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('صفحة الدخول'),
        centerTitle: true,
      ),
      body: const Center(child: LoginForm()),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final KtextFieldColor = Colors.purple.shade50;
  var indicatorValue = 0.1;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Add TextFormFields and ElevatedButton here.
              TextFormField(
                style: TextStyle(fontSize: 14),
                keyboardType: TextInputType.emailAddress,
                textDirection: TextDirection.rtl,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    filled: true,
                    fillColor: KtextFieldColor,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50.0))),
                    hintText: 'البريد الإلكتروني',
                    hintTextDirection: TextDirection.rtl),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),

              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                style: TextStyle(fontSize: 13),
                textDirection: TextDirection.rtl,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.vpn_key),
                    filled: true,
                    fillColor: KtextFieldColor,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50.0))),
                    hintText: 'كلمة المرور',
                    hintTextDirection: TextDirection.rtl),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              SizedBox(
                height: 15.0,
              ),
              ElevatedButton(
                  style: kButtonStyle,
                  onPressed: () {
                    _checkFakeUser();
                    _GoToHomePage();
                  },
                  child: const Text(
                    'دخول',
                    style: kButtonTextStyle,
                  )),
              SizedBox(
                height: 15.0,
              ),
              ElevatedButton(
                  style: kButtonStyle,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterPage()));
                  },
                  child: const Text(
                    'مستخدم جديد قم بالتسجيل هنا',
                    style: kButtonTextStyle,
                  )),

              SizedBox(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgetPage()));
                      },
                      child: const Text(
                        'إضغط هنا',
                        style: TextStyle(fontSize: 18.0),
                      )),
                  const Text(
                    'نسيت كلمة المرور',
                    style: TextStyle(fontSize: 18.0),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              LinearProgressIndicator(
                value: indicatorValue,
              )
            ],
          ),
        ),
      ),
    );
  }

  void _checkFakeUser() async {
    setState(() {
      indicatorValue = 0.2;
    });
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      indicatorValue = 0.6;
    });
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      indicatorValue = 1;
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return DashboardPage();
      }));
    });
  }
}

void _GoToHomePage() {}
