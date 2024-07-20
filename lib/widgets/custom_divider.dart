import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            indent: 120,
            color: Colors.black,
            thickness: 1,
            height: 100,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            'Or',
            style: TextStyle(fontSize: 16.0),
          ),
        ),
        Expanded(
          child: Divider(
            endIndent: 120,
            color: Colors.black,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
