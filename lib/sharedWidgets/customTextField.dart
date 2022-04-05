// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType inputType;
  final String hint;
  final bool obscureText;
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.inputType,
    required this.hint,
    required this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        controller: controller,
        keyboardType: inputType,
        obscureText: obscureText,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          labelStyle: const TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
          labelText: hint,
        ),
      ),
    );
  }
}
