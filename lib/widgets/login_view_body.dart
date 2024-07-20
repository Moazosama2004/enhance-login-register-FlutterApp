import 'package:enhansed_login_register_app/views/register_view.dart';
import 'package:enhansed_login_register_app/widgets/custom_button_apis.dart';
import 'package:enhansed_login_register_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'custom_button.dart';
import 'custom_divider.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({Key? key}) : super(key: key);

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
                'Login',
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                'Welcome back,\nplease login\nto ypur account',
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.black.withOpacity(0.8),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              CustomTextField(text: 'Email'),
              SizedBox(
                height: 10,
              ),
              CustomTextField(text: 'Password'),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Forgot Password?',
                    style: TextStyle(color: Colors.blue, fontSize: 16.0),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              CustomButton(
                text: 'Login',
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
                    'Don\'t have an account?',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RegisterView.id);
                    },
                    child: Text(
                      'Sign Up',
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
