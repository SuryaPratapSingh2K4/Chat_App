import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task_1/Page/Homepage.dart';
// import 'package:task_1/Page/LoginPage.dart';
import 'package:task_1/Services/auth/login_or_register.dart';
// import 'package:task_1/auth/login_or_register.dart';

class AuthGate extends StatelessWidget {
  // final void Function()? onTap;
  const AuthGate({super.key, 
  // required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return MyHomePage();
            } else {
              return LoginOrRegister();
            }
          }),
    );
  }
}
