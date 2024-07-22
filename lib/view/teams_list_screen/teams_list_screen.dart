import 'package:cricket_world/utils/constants.dart';
import 'package:cricket_world/view/players_list_screen/players_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeamsListScreen extends StatefulWidget {
  const TeamsListScreen({super.key});

  @override
  State<TeamsListScreen> createState() => _TeamsListScreenState();
}

class _TeamsListScreenState extends State<TeamsListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        backgroundColor: socondaryColor,
        centerTitle: true,
        title: const Text('Teams Screen',
            style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(const PlayersListScreen());
                        },
                        child: Container(
                          width: Get.width * .3,
                          height: Get.height * .06,
                          decoration: BoxDecoration(
                              color: socondaryColor,
                              borderRadius: BorderRadius.circular(25)),
                          child: const Center(
                              child: Text('Players',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold))),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        width: Get.width * .3,
                        height: Get.height * .06,
                        decoration: BoxDecoration(
                            color: activeButtonColor,
                            borderRadius: BorderRadius.circular(25)),
                        child: const Center(
                            child: Text('Teams',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold))),
                      )
                    ],
                  ),
                  const Icon(
                    Icons.search,
                    color: Colors.white,
                  )
                ],
              ),
              const SizedBox(height: 20),
              const TeamsWidget(
                  imagePath: 'assets/images/teams_flags/PakistanFlag.png',
                  teamName: 'Pakistan',
                  teamInfo: 'Asia'),
              const SizedBox(height: 20),
              const TeamsWidget(
                  imagePath: 'assets/images/teams_flags/AustraliaFlag.png',
                  teamName: 'Pakistan',
                  teamInfo: 'Asia'),
              const SizedBox(height: 20),
              const TeamsWidget(
                  imagePath: 'assets/images/teams_flags/IndiaFlag.png',
                  teamName: 'Pakistan',
                  teamInfo: 'Asia'),
              const SizedBox(height: 20),
              const TeamsWidget(
                  imagePath: 'assets/images/teams_flags/BangladeshFlag.png',
                  teamName: 'Pakistan',
                  teamInfo: 'Asia'),
              const SizedBox(height: 20),
              const TeamsWidget(
                  imagePath: 'assets/images/teams_flags/SouthAfrica.png',
                  teamName: 'Pakistan',
                  teamInfo: 'Asia'),
              const SizedBox(height: 20),
              const TeamsWidget(
                  imagePath: 'assets/images/teams_flags/UAEFlag.png',
                  teamName: 'Pakistan',
                  teamInfo: 'Asia')
            ],
          ),
        ),
      ),
    );
  }
}

class TeamsWidget extends StatelessWidget {
  final String imagePath;
  final String teamName;
  final String teamInfo;

  const TeamsWidget(
      {super.key,
      required this.imagePath,
      required this.teamName,
      required this.teamInfo});

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
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset(
              imagePath,
              height: Get.height * .08,
              width: Get.width * .18,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 8),
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
                          teamName,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          teamInfo,
                          softWrap: true,
                          overflow: TextOverflow.visible,
                        ),
                      ],
                    ),
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
