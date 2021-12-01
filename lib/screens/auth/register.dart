import 'package:demo_hospital/api/services/user_auth.dart';
import 'package:demo_hospital/models/user.dart';
import 'package:demo_hospital/screens/auth/login.dart';
import 'package:flutter/material.dart';

import '../../components/components.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController name = TextEditingController();

  TextEditingController email = TextEditingController();

  TextEditingController pass = TextEditingController();

  TextEditingController confPass = TextEditingController();

  TextEditingController phone = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage('assets/main_logo.jpeg'),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    controller: name,
                    decoration: buildInputDecoration(
                        icon: Icons.account_circle,
                        hintText: 'enter your name'),
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    controller: email,
                    decoration: buildInputDecoration(
                        icon: Icons.email, hintText: 'enter your email'),
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please a Enter';
                      }
                      if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                          .hasMatch(value)) {
                        return 'Please a valid Email';
                      }
                      return null;
                    },
                    // onSaved: (value) {
                    //   // email = value!;
                    // },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    controller: pass,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: buildInputDecoration(
                        icon: Icons.vpn_key_rounded,
                        hintText: 'enter password'),
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    controller: confPass,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: buildInputDecoration(
                        icon: Icons.vpn_key_rounded,
                        hintText: 'confirm password'),
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length < 6) {
                        return 'Please enter valid password: \nminimum 6 letters';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    controller: phone,
                    keyboardType: TextInputType.phone,
                    decoration: buildInputDecoration(
                        icon: Icons.phone,
                        hintText: 'enter phone without 0, eg: 9XXXXXXXXX'),
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate() &&
                            pass.text == confPass.text) {
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.
                          Scaffold.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')));
                          var user = UserRegister(
                              email: email.text,
                              fulllName: name.text,
                              password: pass.text,
                              mobile: phone.text);
                          UserSession.userRegister(user, onSuccessful: () {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return const LoginPage();
                            }));
                          });

                          // print(user.toJson());
                        } else {
                          Scaffold.of(context).showSnackBar(const SnackBar(
                              content: Text('Write correct Data')));
                        }
                      },
                      child: const Text('submit')),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('cancel')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
