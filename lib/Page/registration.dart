import 'package:flutter/material.dart';
import 'package:task_1/Services/auth/auth_service.dart';
import 'package:task_1/component/my_button.dart';
import 'package:task_1/component/textfield.dart';
// import 'package:task_1/Page/LoginPage.dart';
// import 'package:task_1/Page/LoginPage.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confpasswordController = TextEditingController();

  final void Function()? onTap;
  RegisterPage({super.key, required this.onTap});

  void Register(BuildContext context) {
    final _auth = AuthService();

    if (_passwordController.text == _confpasswordController.text) {
      try {
        _auth.signUpWithEmailPassword(
            _emailController.text, _passwordController.text);
      } catch (e) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(e.toString()),
                ));
      }
    } else {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text("Password doesnt match"),
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 12, top: 12),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/images/login_image.png",
              fit: BoxFit.cover,
            ),
            Container(
              width: 414,
              height: 56,
              padding: EdgeInsets.only(left: 11, top: 6, bottom: 6),
              child: Text(
                'Welcome Back!',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: MyTextField(
                    obscureText: false,
                    controller: _emailController,
                    hintText: "Enter Your Email")),
            SizedBox(
              height: 15,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: MyTextField(
                    obscureText: true,
                    controller: _passwordController,
                    hintText: "Enter your password")),
            SizedBox(
              height: 20,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: MyTextField(
                    obscureText: true,
                    controller: _confpasswordController,
                    hintText: "Confirm Password")),
            SizedBox(
              height: 20,
            ),
            MyButton(onTap: () => Register(context), text: "Register"),
          ],
        ),
      ),
    ));
  }
}
