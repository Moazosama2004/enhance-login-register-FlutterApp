import 'package:flutter/material.dart';

import '../widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  static final String id = 'LoginView';
  @override
  Widget build(BuildContext context) {
    return LoginViewBody();
  }
}
