import 'package:enhansed_login_register_app/helper/show_snack_bar.dart';
import 'package:enhansed_login_register_app/views/register_view.dart';
import 'package:enhansed_login_register_app/views/welcome_view.dart';
import 'package:enhansed_login_register_app/widgets/custom_button_apis.dart';
import 'package:enhansed_login_register_app/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'custom_button.dart';
import 'custom_divider.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({Key? key}) : super(key: key);

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  String? email;
  String? password;
  bool isLoading = false;
  TextEditingController emailContoller = TextEditingController();
  TextEditingController passwordContoller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
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
                CustomTextField(
                  text: 'Email',
                  onChange: (data) {
                    email = data;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  obscureText: true,
                  text: 'Password',
                  onChange: (data) {
                    password = data;
                  },
                ),
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
                  onTap: () async {
                    isLoading = true;
                    setState(() {

                    });
                    try {
                      final user = await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: email!, password: password!);
                      showSnackBar(context, message: 'Success');
                      emailContoller.text = '';
                      passwordContoller.text = '';
                      Navigator.pushNamed(context, WelcomeView.id);
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        print('No user found for that email.');
                      } else if (e.code == 'wrong-password') {
                        print('Wrong password provided for that user.');
                        passwordContoller.text = '';
                      }
                    }


                    isLoading = false;
                    setState(() {

                    });
                  },
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
      ),
    );
  }
}
