import 'package:flutter/material.dart';
import 'package:kkuvc/Login/Screen/sign_Up.dart';
import 'package:kkuvc/Login/Widget/button.dart';
import 'package:kkuvc/Login/Widget/text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 149, 213, 238),
      body: SafeArea(
          child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              height: height / 2.7,
              child: Image.asset("images/image/Login.png"),
            ),
            //
            TextFieldInpute(
              textEditingController: emailController,
              hintText: "Enter Your Email",
              icon: Icons.email,
            ),
            TextFieldInpute(
              textEditingController: passwordController,
              hintText: "Enter Your Password",
              icon: Icons.lock,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 35),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black45),
                ),
              ),
            ),
            MyButton(
              onTap: () {},
              text: "Log  In",
            ),
            SizedBox(height: height / 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't Have An Accunt ",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUpScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    "SignUp",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
