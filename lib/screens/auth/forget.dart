import 'package:flutter/material.dart';

class ForgetPage extends StatelessWidget {
  const ForgetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('أسترجاع الحساب'),
        centerTitle: true,
      ),
      body: const Center(child: ForgetForm()),
    );
  }
}

class ForgetForm extends StatefulWidget {
  const ForgetForm({Key? key}) : super(key: key);

  @override
  _ForgetFormState createState() => _ForgetFormState();
}

class _ForgetFormState extends State<ForgetForm> {
  final _formKey = GlobalKey<FormState>();
  final KtextFieldColor = Colors.purple.shade50;

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
              Text(
                'الرجاء قم بإدخال البريد الإلكتروني:',
                textAlign: TextAlign.right,
              ),
              // Add TextFormFields and ElevatedButton here.
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                textDirection: TextDirection.rtl,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    filled: true,
                    fillColor: KtextFieldColor,
                    border: OutlineInputBorder(),
                    hintText: ' البريد الإلكتروني',
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
                height: 15.0,
              ),
              ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'تحقق',
                    style: TextStyle(fontSize: 20.0),
                  )),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
