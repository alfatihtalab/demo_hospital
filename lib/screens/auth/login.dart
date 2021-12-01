import 'package:demo_hospital/api/services/user_auth.dart';
import 'package:demo_hospital/components/input_decoration_text_auth.dart';
import 'package:demo_hospital/models/user.dart';
import 'package:demo_hospital/screens/auth/register.dart';
import 'package:flutter/material.dart';

import '../../app_theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController username = TextEditingController();

  TextEditingController password = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  var currentFocus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const CircleAvatar(
                    radius: 70,
                    //backgroundImage: AssetImage('assets/main_logo.jpeg'),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                    child: TextFormField(
                      controller: username,
                      decoration: buildInputDecoration(
                          icon: Icons.account_circle, hintText: 'username'),
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter username';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                    child: TextFormField(
                      controller: password,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      decoration: buildInputDecoration(
                          icon: Icons.vpn_key_rounded, hintText: 'password'),
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter password';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                    child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            // If the form is valid, display a snackbar. In the real world,
                            // you'd often call a server or save the information in a database.
                            // Scaffold.of(context).showSnackBar(const SnackBar(
                            //     content: Text('Processing Data')));
                            FocusScope.of(context).requestFocus(FocusNode());
                            // await Future.delayed(const Duration(seconds: 3));
                            var user = UserLogin(
                                userName: username.text,
                                password: password.text);
                            UserSession.userLogin(user, onSuccessful: () {
                              print('Logged in');
                            });
                            // print(user.toJson());
                          }
                          ;
                        },
                        child: const Text('login')),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const RegisterPage();
                          }));
                        },
                        child: const Text('register now here')),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Can't remeber your account?",
                            style: DemoTheme.lightTextTheme.headline3,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'click here',
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.purple),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
