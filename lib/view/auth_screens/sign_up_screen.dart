import 'package:cricket_world/authentication_services.dart';
import 'package:cricket_world/view/home_screen/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../reusable_widgets/reusable_textfield.dart';
import '../../utils/constants.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _auth = AuthenticationServices();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

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
                  fit: BoxFit.none,
                  alignment: Alignment.topCenter),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                children: [
                  SizedBox(height: 40),
                  Text(
                    'Cricket World',
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
                      child: Text('Register',
                          style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              color: Colors.white))),
                  const SizedBox(height: 20),
                  ReUsableTextField(
                      text: 'user name',
                      icon: Icons.person,
                      fieldController: nameController),
                  const SizedBox(height: 20),
                  ReUsableTextField(
                      text: "email",
                      icon: Icons.email,
                      fieldController: emailController),
                  const SizedBox(height: 20),
                  ReUsableTextField(
                      text: "password",
                      icon: Icons.key,
                      suffixIcon: Icons.visibility_off,
                      fieldController: passwordController),
                  const SizedBox(height: 20),
                  ReUsableTextField(
                      text: "confirm password",
                      icon: Icons.key,
                      suffixIcon: Icons.visibility_off,
                      fieldController: confirmPasswordController),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      _registerUser();
                    },
                    child: Container(
                      width: Get.width,
                      height: Get.height * .077,
                      decoration: BoxDecoration(
                        color: const Color(0xff246BFD),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          'Register',
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
                      const Text("Already have an account? ",
                          style: TextStyle(color: Colors.white, fontSize: 17)),
                      InkWell(
                        onTap: () {
                          Get.to(const LogInScreen());
                        },
                        child: const Text("Sign In",
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

  _registerUser() async {
    final user = await _auth.createUserWithEmailAndPassword(
        emailController.text, passwordController.text);
    if (user != null) {
      Get.snackbar('Congrats', 'User Created Successfully',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: CupertinoColors.systemYellow);
      Get.to(const HomeScreen());
    }
  }
}
