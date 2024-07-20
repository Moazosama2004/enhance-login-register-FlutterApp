import 'package:enhansed_login_register_app/views/login_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../helper/show_snack_bar.dart';
import '../views/welcome_view.dart';
import 'custom_button.dart';
import 'custom_button_apis.dart';
import 'custom_divider.dart';
import 'custom_text_field.dart';

class RegisterViewBody extends StatefulWidget {
  RegisterViewBody({Key? key}) : super(key: key);

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
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
                CustomTextField(
                  controller: emailContoller,
                  text: 'Email',
                  onChange: (data) {
                    email = data;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  controller: passwordContoller,
                  obscureText: true,
                  text: 'Password',
                  onChange: (data) {
                    password = data;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 50,
                ),
                CustomButton(
                  text: 'Register',
                  onTap: () async {
                    isLoading = true;
                    setState(() {});
                    try {
                      final user = await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                        email: email!,
                        password: password!,
                      );
                      showSnackBar(context, message: 'Success');
                      emailContoller.text = '';
                      passwordContoller.text = '';
                      Navigator.pushNamed(context, WelcomeView.id);

                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        showSnackBar(context,
                            message: 'The password provided is too weak.');
                        passwordContoller.text = '';
                      } else if (e.code == 'email-already-in-use') {
                        showSnackBar(context,
                            message:
                                'The account already exists for that email.');
                      }
                    } catch (e) {
                      print(e);
                    }


                    isLoading = false;
                    setState(() {});
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
      ),
    );
  }
}
