import 'package:cricket_world/authentication_services.dart';
import 'package:cricket_world/view/auth_screens/login_screen.dart';
import 'package:cricket_world/view/profile_screen/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _auth = AuthenticationServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 30),

              //**************** Profile Picture Section ***************//

              Align(
                alignment: Alignment.center,
                child: Container(
                  width: Get.width * .3,
                  height: Get.height * .165,
                  child: Column(children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        'assets/images/players_images/Naseem.jpg',
                        height: Get.height * .13,
                        width: Get.width * .3,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Align(
                        alignment: Alignment.centerRight,
                        child: Icon(Icons.edit, color: Colors.white))
                  ]),
                ),
              ),
              const Text('Zeeshan Ahmad',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19)),
              const SizedBox(height: 5),
              const Text('#Beliver in yourself',
                  style: TextStyle(fontSize: 17)),
              const SizedBox(height: 22),
              Row(children: [
                InkWell(
                  onTap: () => Get.to(const ProfileScreen()),
                  child: Container(
                    width: Get.width * .36,
                    height: Get.height * .08,
                    decoration: BoxDecoration(
                        color: activeButtonColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: const Center(
                      child: Text(
                        'My Profile',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: Get.width * .04),
                InkWell(
                  onTap: () => Get.to(const SettingsScreen()),
                  child: Container(
                    width: Get.width * .36,
                    height: Get.height * .08,
                    decoration: BoxDecoration(
                        color: socondaryColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: const Center(
                      child: Text(
                        'Settings',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ]),
              const SizedBox(height: 18),
              const SettingsWidget(
                  icon: 'assets/images/icons/user.png',
                  heading: 'Name',
                  subheading: 'Zeeshan Ahmad'),
              const SizedBox(height: 18),
              const SettingsWidget(
                  icon: 'assets/images/icons/email.png',
                  heading: 'Email',
                  subheading: 'zeeshanahmad@gmail.com'),
              const SizedBox(height: 18),
              const SettingsWidget(
                  icon: 'assets/images/icons/telephone.png',
                  heading: 'Phone',
                  subheading: '03029922332'),
              const SizedBox(height: 18),
              const SettingsWidget(
                  icon: 'assets/images/icons/location.png',
                  heading: 'Location',
                  subheading: 'Karak'),
              const SizedBox(height: 18),
              InkWell(
                onTap: () {
                  _auth.signOut();
                  Get.to(const LogInScreen());
                },
                child: const SettingsWidget(
                    icon: 'assets/images/icons/logout.png',
                    heading: 'Logout',
                    subheading: ''),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingsWidget extends StatelessWidget {
  final String icon;
  final String heading;
  final String subheading;

  const SettingsWidget(
      {super.key,
      required this.icon,
      required this.heading,
      required this.subheading});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: Get.height * .08,
      width: Get.width,
      decoration: BoxDecoration(
        // color: socondaryColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: socondaryColor,
                    borderRadius: BorderRadius.circular(25)),
                width: Get.width * .12,
                height: Get.height * .054,
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      icon,
                      color: Colors.white,
                      height: Get.height * .03,
                      width: Get.width * .12,
                    ),
                  ),
                ),
              ),
              SizedBox(height: Get.height * .03)
            ],
          ),
          const SizedBox(width: 18),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: Get.width * .7,
                height: Get.height * .08,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          heading,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          subheading,
                          softWrap: true,
                          overflow: TextOverflow.visible,
                        ),
                      ],
                    ),
                    const Icon(Icons.arrow_forward_ios, color: Colors.white)
                  ],
                ),
              ),
              Container(
                color: Colors.black26,
                height: 1,
                width: Get.width * .66,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
