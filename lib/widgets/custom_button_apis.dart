import 'package:flutter/material.dart';

class CustomButtonApis extends StatelessWidget {
  const CustomButtonApis({Key? key, required this.image, required this.text})
      : super(key: key);

  final String image, text;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 2),
        ]),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(image),
              Text(
                text,
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
