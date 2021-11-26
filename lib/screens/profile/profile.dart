import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../app_theme.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SafeArea(
          child: Container(
        margin: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Container(
              //   decoration: BoxDecoration(
              //       color: Colors.amberAccent,
              //       image: DecorationImage(
              //           image: AssetImage('assets/user_p.png'),
              //           fit: BoxFit.contain),
              //       borderRadius: BorderRadius.all(Radius.circular(50.0))),
              //   height: 150,
              // ),
              // Container(
              //   decoration: BoxDecoration(),
              //   padding: EdgeInsets.all(8.0),
              //   child: Center(
              //     child: CircleAvatar(
              //       backgroundImage: AssetImage('assets/user_p.png'),
              //       radius: 65,
              //     ),
              //   ),
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    elevation: 12,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/user_p.png'),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Card(
                    child: Text(
                      'Username',
                      style: DemoTheme.lightTextTheme.headline2,
                    ),
                  ),
                  Text('email@example.com'),
                  Text('username'),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
