import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../reusable_widgets/reusable_button.dart';
import '../../utils/constants.dart';
import '../auth_screens/login_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentpage = 0;
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: PageView(
        controller: pageController,
        scrollDirection: Axis.horizontal,
        onPageChanged: (index) {
          setState(() {
            currentpage = index;
          });
        },
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Cricket World',
                  style: GoogleFonts.sourceSans3(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white),
                ),
                Container(
                  width: Get.width * .7,
                  height: Get.height * .3,
                  decoration: BoxDecoration(
                      color: socondaryColor,
                      borderRadius: BorderRadius.circular(23)),
                  child: Image.asset(
                    "assets/images/onboarding_images/Onboarding1.png",
                    fit: BoxFit.contain,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      "Experience Cricket Like Never Before",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.sourceSans3(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.white),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ReUsableButton(
                            onTap: () {
                              Get.to(const LogInScreen());
                            },
                            buttonText: 'Sign In',
                            width: Get.width * .5),
                        GestureDetector(
                          onTap: () {
                            pageController.animateToPage(1,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease);
                          },
                          child: Row(
                            children: [
                              Text(
                                "Next",
                                style: GoogleFonts.sourceSans3(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 19,
                                    color: Colors.white),
                              ),
                              const SizedBox(width: 10),
                              Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                  color: const Color(0xff246BFD),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: const Icon(
                                  Icons.arrow_forward,
                                  color: Colors.black,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Cricket World',
                  style: GoogleFonts.sourceSans3(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white),
                ),
                Container(
                  width: Get.width * .7,
                  height: Get.height * .3,
                  decoration: BoxDecoration(
                      color: socondaryColor,
                      borderRadius: BorderRadius.circular(23)),
                  child: Image.asset(
                    "assets/images/onboarding_images/Onboarding2.png",
                    fit: BoxFit.contain,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      "Experience Cricket Like Never Before",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.sourceSans3(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.white),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ReUsableButton(
                            onTap: () {
                              Get.to(const LogInScreen());
                            },
                            buttonText: 'Sign In',
                            width: Get.width * .5),
                        GestureDetector(
                          onTap: () {
                            pageController.animateToPage(2,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease);
                          },
                          child: Row(
                            children: [
                              Text(
                                "Next",
                                style: GoogleFonts.sourceSans3(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 19,
                                    color: Colors.white),
                              ),
                              const SizedBox(width: 10),
                              Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                  color: const Color(0xff246BFD),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: const Icon(
                                  Icons.arrow_forward,
                                  color: Colors.black,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Cricket World',
                  style: GoogleFonts.sourceSans3(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white),
                ),
                Container(
                  width: Get.width * .7,
                  height: Get.height * .3,
                  decoration: BoxDecoration(
                      color: socondaryColor,
                      borderRadius: BorderRadius.circular(23)),
                  child: Image.asset(
                    "assets/images/onboarding_images/Onboarding3.png",
                    fit: BoxFit.contain,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      "Experience Cricket Like Never Before",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.sourceSans3(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.white),
                    ),
                    const SizedBox(height: 20),
                    ReUsableButton(
                      onTap: () {
                        Get.to(const LogInScreen());
                      },
                      buttonText: 'Sign In',
                      width: Get.width * .5,
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
