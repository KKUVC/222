import 'package:flutter/material.dart';
import 'package:kkuvc/Login/Screen/home_screen.dart';
import 'package:kkuvc/Login/Screen/login_screen.dart';
import 'package:kkuvc/Login/Services/authentication.dart';
import 'package:kkuvc/Login/Widget/snack_bar.dart';

import '../Widget/button.dart';
import '../Widget/text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  bool isLoading = false;

  void signUpUser() async {
    String res = await AuthServicews().signUpUser(
      email: emailController.text,
      password: passwordController.text,
      name: nameController.text,
    );

    if (res == "Success") {
      setState(() {
        isLoading = true;
      });
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    } else {
      setState(() {
        isLoading = false;
      });
      showSnackBar(context, res);
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
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
              textEditingController: nameController,
              hintText: "Enter Your Name",
              icon: Icons.person,
            ),
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

            MyButton(onTap: signUpUser, text: "Sign Up"),
            SizedBox(height: height / 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Alreday have an account? ",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    "Log in ",
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
