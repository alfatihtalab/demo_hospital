// import 'package:demo_hospital/utilits.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// mixin InputValidationMixin {
//   bool isPasswordValid(String password) => password.length == 6;
//
//   bool isEmailValid(String email) {
//     var pattern =
//         r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
//     RegExp regex = RegExp(pattern);
//     return regex.hasMatch(email);
//   }
// }
//
// class RegisterPage extends StatefulWidget {
//   const RegisterPage({Key? key}) : super(key: key);
//
//   @override
//   _RegisterPageState createState() => _RegisterPageState();
// }
//
// class _RegisterPageState extends State<RegisterPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('تسجيل جديد'),
//           centerTitle: true,
//         ),
//         body: const Center(child: MyRegisterForm()));
//   }
// }
//
// class MyRegisterForm extends StatefulWidget with InputValidationMixin {
//   const MyRegisterForm({Key? key}) : super(key: key);
//
//   @override
//   _MyRegisterFormState createState() => _MyRegisterFormState();
// }
//
// class _MyRegisterFormState extends State<MyRegisterForm>
//     with InputValidationMixin {
//   final _formKey = GlobalKey<FormState>();
//   final KtextFieldColor = Colors.purple.shade50;
//   final name = TextEditingController();
//   var email = TextEditingController();
//   final password = TextEditingController();
//   final password2 = TextEditingController();
//   final phone = TextEditingController();
//
//   bool _validateName = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               // Add TextFormFields and ElevatedButton here.
//
//               buildTextFormField(
//                   validate: () {
//                     return true;
//                   },
//                   hintText: 'الإسم بالكامل',
//                   iconData: Icons.person,
//                   controller: name,
//                   errorText: 'enter valid name'),
//               const SizedBox(
//                 height: 10.0,
//               ),
//               buildTextFormField(
//                 validate: isEmailValid(email.text),
//                 hintText: 'البريد الإلكتروني',
//                 iconData: Icons.email,
//                 controller: email,
//                 errorText: 'Enter valid email',
//               ),
//               const SizedBox(
//                 height: 10.0,
//               ),
//               buildTextFormField(
//                 hintText: 'كلمة المرور',
//                 iconData: Icons.vpn_key,
//                 controller: password,
//                 errorText: 'password must ..',
//               ),
//               const SizedBox(
//                 height: 10.0,
//               ),
//
//               buildTextFormField(
//                 hintText: 'تأكيد كلمة المرور',
//                 iconData: Icons.vpn_key,
//                 controller: password2,
//                 errorText: 'check 2 passowrds are the same ',
//               ),
//               const SizedBox(
//                 height: 10.0,
//               ),
//               buildTextFormField(
//                 hintText: 'رقم الهاتف',
//                 iconData: Icons.phone,
//                 controller: phone,
//                 errorText: 'Please enter right number',
//               ),
//               const SizedBox(
//                 height: 15.0,
//               ),
//               buildRegisterButton('تسجيل', onTab: () {
//                 if (_formKey.currentState!.validate()) {
//                   if (password.text != password2.text ||
//                       password2.text.isEmpty ||
//                       password.text.isEmpty ||
//                       isPasswordValid(password.text) ||
//                       isEmailValid(email.text)) {
//                     print('please ensure 2 passwords are the same !');
//                   }
//                 }
//
//                 // var user = User(
//                 //     email: email,
//                 //     fulllName: fulllName,
//                 //     password: password,
//                 //     mobile: mobile,
//                 //     userType: userType,
//                 //     requestType: requestType,
//                 //     organizationId: organizationId)
//               }),
//               const SizedBox(
//                 height: 15.0,
//               ),
//               buildRegisterButton('إلغاء التسجيل', onTab: () {}),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   ElevatedButton buildRegisterButton(String text, {required Function onTab}) {
//     return ElevatedButton(
//         style: kButtonStyle,
//         onPressed: () {
//           onTab();
//         },
//         child: Text(
//           text,
//           style: TextStyle(fontSize: 20.0),
//         ));
//   }
//
//   TextFormField buildTextFormField(
//       {required String hintText,
//         required IconData iconData,
//         required TextEditingController controller,
//         required String errorText,
//         required Function validate}) {
//     return TextFormField(
//       controller: controller,
//       textDirection: TextDirection.rtl,
//       decoration: InputDecoration(
//           prefixIcon: Icon(iconData),
//           filled: true,
//           fillColor: KtextFieldColor,
//           border: buildOutlineInputBorder(),
//           hintText: hintText,
//           hintStyle: buildTextStyleHintInput(),
//           hintTextDirection: TextDirection.rtl),
//       // The validator receives the text that the user has entered.
//       validator: (value) {
//         if (value == null || value.isEmpty || validate(value)) {
//           return errorText;
//         }
//         return null;
//       },
//     );
//   }
//
//   TextStyle buildTextStyleHintInput() => const TextStyle(fontSize: 14);
//
//   OutlineInputBorder buildOutlineInputBorder() {
//     return const OutlineInputBorder(
//         borderRadius: BorderRadius.all(Radius.circular(30.0)));
//   }
// }
