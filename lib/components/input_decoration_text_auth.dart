import 'package:flutter/material.dart';

InputDecoration buildInputDecoration(
    {required IconData icon, required String hintText}) {
  return InputDecoration(
    prefixIcon: Icon(icon),
    hintText: hintText,
    // fillColor: Colors.purple.shade50,
    // filled: true,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25.0),
      borderSide: const BorderSide(
        color: Colors.deepPurple,
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
