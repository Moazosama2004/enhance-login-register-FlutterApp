import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key, required this.text}) : super(key: key);

  final String text;
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration:
          InputDecoration(label: Text(text), border: UnderlineInputBorder()),
    );
  }
}
