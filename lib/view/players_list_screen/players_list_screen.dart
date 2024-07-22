import 'package:cricket_world/view/profile_screen/player_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../utils/constants.dart';
import '../teams_list_screen/teams_list_screen.dart';

class PlayersListScreen extends StatefulWidget {
  const PlayersListScreen({super.key});

  @override
  State<PlayersListScreen> createState() => _PlayersListScreenState();
}

class _PlayersListScreenState extends State<PlayersListScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: socondaryColor,
        title: const Text(
          'Players List Screen',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: Get.width * .3,
                      height: Get.height * .06,
                      decoration: BoxDecoration(
                        color: activeButtonColor,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Center(
                        child: Text(
                          'Players',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        Get.to(const TeamsListScreen());
                      },
                      child: Container(
                        width: Get.width * .3,
                        height: Get.height * .06,
                        decoration: BoxDecoration(
                          color: socondaryColor,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: const Center(
                          child: Text(
                            'Teams',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const Icon(
                  Icons.search,
                  color: Colors.white,
                )
              ],
            ),
            const SizedBox(height: 15),
            //********* Fetching Data From Firebase **************//
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: _firestore.collection('Players').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Expanded(child: Text('Error: ${snapshot.error}'));
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  }

                  final players = snapshot.data!.docs;

                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: players.length,
                    itemBuilder: (context, index) {
                      final team1 = players[index]['Team1'];
                      final team2 = players[index]['Team2'];
                      final playerName = players[index]['Player_Name'];
                      final playerRole = players[index]['Player_Role'];
                      final playerImage = players[index]['Player_Image'];
                      final playerAge = int.parse(players[index]['Player_Age']);
                      final battingStyle =
                          players[index]['Player_Batting_Style'];
                      final bowlingStyle =
                          players[index]['Player_Bowling_Style'];
                      final playerDOB = players[index]['DOB'];

                      return PlayersWidget(
                        team1: team1,
                        team2: team2,
                        playerDOB: playerDOB,
                        bowlingStyle: bowlingStyle,
                        battingStyle: battingStyle,
                        playerName: playerName,
                        aboutPlayer: playerRole,
                        imagePath: playerImage,
                        onTap: () {
                          // Navigate to DetailsScreen with player details
                          Get.to(PlayerDetailsScreen(
                            team1: team1,
                            team2: team2,
                            playerDOB: playerDOB,
                            bowlingStyle: bowlingStyle,
                            battingStyle: battingStyle,
                            playerName: playerName,
                            playerImage: playerImage,
                            playerAge: playerAge,
                            playerRole: playerRole,
                          ));
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PlayersWidget extends StatelessWidget {
  final String imagePath;
  final String playerName;
  final String aboutPlayer;
  final Function onTap;

  const PlayersWidget({
    super.key,
    required this.imagePath,
    required this.playerName,
    required this.aboutPlayer,
    required this.onTap,
    required battingStyle,
    required playerDOB,
    required bowlingStyle,
    required team1,
    required team2,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                imagePath,
                height: 70,
                width: 70,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    playerName,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    aboutPlayer,
                    softWrap: true,
                    overflow: TextOverflow.visible,
                  ),
                  const SizedBox(height: 10),
                  Container(
                    color: Colors.white24,
                    height: 1,
                    width: Get.width * .66,
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
