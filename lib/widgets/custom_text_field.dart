import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key, required this.text,  this.onChange,  this.obscureText = false,  this.keyboardType = TextInputType.text,  this.controller}) : super(key: key);

  final String text;
  final Function(String)? onChange;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      onChanged: onChange,
      decoration:
          InputDecoration(label: Text(text), border: UnderlineInputBorder()),
    );
  }
}
