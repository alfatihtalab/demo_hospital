import 'package:demo_hospital/models/user.dart';
import 'package:demo_hospital/screens/auth/login.dart';
import 'package:demo_hospital/services/user_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utilits.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: Center(child: RegistrationForm())),
    );
  }
}

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({Key? key}) : super(key: key);

  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController confPass = TextEditingController();
  TextEditingController phone = TextEditingController();
  final UserSession _userSession = UserSession(url: mURL);
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const CircleAvatar(
              radius: 70,
              child: Image(
                image: AssetImage('assets/doctor_t.png'),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
              child: TextFormField(
                controller: name,
                decoration: buildInputDecoration(
                    icon: Icons.account_circle, hintText: 'enter your name'),
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
              padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
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
              padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
              child: TextFormField(
                controller: pass,
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: buildInputDecoration(
                    icon: Icons.vpn_key_rounded, hintText: 'enter password'),
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
              padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
              child: TextFormField(
                controller: confPass,
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: buildInputDecoration(
                    icon: Icons.vpn_key_rounded, hintText: 'confirm password'),
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
              padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
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
              padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
              child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      Scaffold.of(context).showSnackBar(
                          SnackBar(content: Text('Processing Data')));
                      var user = User(
                          email: email.text,
                          fulllName: name.text,
                          password: pass.text,
                          mobile: '249${phone.text}',
                          userType: 'string',
                          requestType: 'string',
                          organizationId: 0);
                      _userSession.userRegister(user, onSuccessful: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return LoginPage();
                        }));
                      });
                      // print(user.toJson());
                    }
                    ;
                  },
                  child: const Text('submit')),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('cancel')),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration buildInputDecoration(
      {required IconData icon, required String hintText}) {
    return InputDecoration(
      prefixIcon: Icon(icon),
      hintText: hintText,
      fillColor: Colors.purple.shade50,
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: const BorderSide(
          color: Colors.purpleAccent,
          width: 1.5,
        ),
      ),
      border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.purple,
            width: 1.5,
          ),
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
    );
  }
}
