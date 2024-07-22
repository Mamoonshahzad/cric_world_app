import 'package:cricket_world/authentication_services.dart';
import 'package:cricket_world/view/auth_screens/sign_up_screen.dart';
import 'package:cricket_world/view/home_screen/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../reusable_widgets/reusable_textfield.dart';
import '../../utils/constants.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _auth = AuthenticationServices();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: Get.width,
            height: Get.height,
            decoration: const BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                image: AssetImage("assets/images/auth_images/auth_image.png"),
                fit: BoxFit.contain,
                alignment: Alignment.topCenter,
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                children: [
                  SizedBox(height: 40),
                  Text(
                    'Mamoon Shahzad',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: const BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30))),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Welcome',
                          style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              color: Colors.white))),
                  const SizedBox(height: 20),
                  ReUsableTextField(
                      text: 'email',
                      icon: Icons.email,
                      fieldController: emailController),
                  const SizedBox(height: 20),
                  ReUsableTextField(
                      text: "Password",
                      icon: Icons.key,
                      suffixIcon: Icons.visibility,
                      fieldController: passwordController),
                  const SizedBox(height: 20),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          Checkbox(
                            value: false,
                            onChanged: (newValue) {},
                            fillColor: MaterialStateProperty.all(Colors.white),
                            checkColor: Colors.black,
                          ),
                          const Text('Remember me',
                              style: TextStyle(color: Colors.white))
                        ]),
                        const Text('Forgot Password',
                            style: TextStyle(color: Colors.white))
                      ]),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () => loginUser(),
                    child: Container(
                      width: Get.width,
                      height: Get.height * .077,
                      decoration: BoxDecoration(
                        color: const Color(0xff246BFD),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          'Login',
                          style: GoogleFonts.sourceSans3(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account? ",
                          style: TextStyle(color: Colors.white, fontSize: 17)),
                      InkWell(
                        onTap: () {
                          Get.to(const SignUpScreen());
                        },
                        child: const Text("Sign Up",
                            style: TextStyle(color: Colors.blue, fontSize: 17)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  loginUser() async {
    final user = await _auth.loginUserWithEmailAndPassword(
        emailController.text, passwordController.text);

    if (user != null) {
      Get.snackbar('Success', 'User Logged In Successfully',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: CupertinoColors.systemYellow);
      Get.to(const HomeScreen());
    }
  }
}
