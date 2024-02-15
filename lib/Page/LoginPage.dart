import 'package:flutter/material.dart';
import 'package:task_1/Services/auth/auth_service.dart';
import 'package:task_1/component/my_button.dart';
import 'package:task_1/component/textfield.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  void login(BuildContext context) async {
    final authService = AuthService();
    try {
      await authService.signInWithEmailPassword(
          _emailController.text, _passwordController.text);
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(e.toString()),
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  resizeToAvoidBottomInset: false,
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
                MyButton(onTap: () => login(context), text: "login"),
                SizedBox(
                  height: 180,
                ),
                GestureDetector(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('create an account?'),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
