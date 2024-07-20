import 'package:enhansed_login_register_app/views/register_view.dart';
import 'package:enhansed_login_register_app/views/welcome_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'views/login_view.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(LoginRegisterApp());
}

class LoginRegisterApp extends StatelessWidget {
  const LoginRegisterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        LoginView.id: (context) => LoginView(),
        RegisterView.id: (context) => RegisterView(),
        WelcomeView.id: (context) => WelcomeView(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Abel'),
      initialRoute: LoginView.id,
    );
  }
}
