import 'package:flutter/material.dart';

const String mURL = 'http://myteethdh-002-site3.itempurl.com';
final ButtonStyle kButtonStyle = ButtonStyle(
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
        side: const BorderSide(color: Colors.white30)),
  ),
);
// button text style
const TextStyle kButtonTextStyle = TextStyle(
  fontSize: 20,
);
//login register reset input style
