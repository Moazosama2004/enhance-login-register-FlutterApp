import 'package:enhansed_login_register_app/views/login_view.dart';
import 'package:flutter/material.dart';

import 'custom_button.dart';
import 'custom_button_apis.dart';
import 'custom_divider.dart';
import 'custom_text_field.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 100,
              ),
              Text(
                'Register',
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                'Let\'s Get\nyou on board',
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.black.withOpacity(0.8),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              CustomTextField(text: 'Full Name'),
              SizedBox(
                height: 10,
              ),
              CustomTextField(text: 'Email'),
              SizedBox(
                height: 10,
              ),
              CustomTextField(text: 'Password'),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 50,
              ),
              CustomButton(
                text: 'Register',
              ),
              CustomDivider(),
              Row(
                children: [
                  CustomButtonApis(
                    text: 'Google',
                    image: 'assets/images/google.png',
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  CustomButtonApis(
                    text: 'Facebook',
                    image: 'assets/images/facebook.png',
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Sign In',
                      style: TextStyle(fontSize: 25, color: Colors.blue),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
