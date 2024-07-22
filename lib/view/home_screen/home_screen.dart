import 'package:cricket_world/utils/constants.dart';
import 'package:cricket_world/view/charts_screen/charts_screen.dart';
import 'package:cricket_world/view/teams_list_screen/teams_list_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../discover_screen/discover_screen.dart';
import '../players_list_screen/players_list_screen.dart';
import '../profile_screen/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
            backgroundColor: socondaryColor,
            activeColor: Colors.yellow,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home)),
              BottomNavigationBarItem(icon: Icon(Icons.watch_later_outlined)),
              BottomNavigationBarItem(icon: Icon(Icons.insert_chart_outlined)),
              BottomNavigationBarItem(icon: Icon(Icons.person)),
            ]),
        tabBuilder: (context, index) {
          switch (index) {
            case 0:
              return CupertinoTabView(
                builder: (context) {
                  return const CupertinoPageScaffold(child: HomeScreens());
                },
              );

            case 1:
              return CupertinoTabView(
                builder: (context) {
                  return const CupertinoPageScaffold(child: DiscoverScreen());
                },
              );

            case 2:
              return CupertinoTabView(
                builder: (context) {
                  return const CupertinoPageScaffold(child: ChartsScreen());
                },
              );

            case 3:
              return CupertinoTabView(
                builder: (context) {
                  return const CupertinoPageScaffold(child: ProfileScreen());
                },
              );
          }
          return Container();
        });
  }
}

class HomeScreens extends StatelessWidget {
  const HomeScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: socondaryColor,
          title: const Text('home screen',
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white))),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () => Get.to(const PlayersListScreen()),
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
                    InkWell(
                      onTap: () => Get.to(const TeamsListScreen()),
                      child: Container(
                        width: Get.width * .3,
                        height: Get.height * .06,
                        decoration: BoxDecoration(
                            color: socondaryColor,
                            borderRadius: BorderRadius.circular(25)),
                        child: const Center(
                            child: Text('Teams',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold))),
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
            const SizedBox(height: 20),
            const Text('Live Matches',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 19)),
            const SizedBox(height: 10),

            //********Live Match Container*********//

            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: socondaryColor,
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Text('Live', style: TextStyle(color: Colors.redAccent)),
                    Text(', Eliminator 2 ,',
                        style: TextStyle(color: Colors.white)),
                    Text(' PSl 2024 ,', style: TextStyle(color: Colors.white)),
                    Text(' Karachi ,', style: TextStyle(color: Colors.white)),
                  ]),
                  SizedBox(height: 15),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('PZ', style: TextStyle(color: Colors.white)),
                        Text('(2/20 ov) 30 runs',
                            style: TextStyle(color: Colors.white))
                      ]),
                  SizedBox(height: 15),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('LQ', style: TextStyle(color: Colors.white)),
                        Text('yet to bat',
                            style: TextStyle(color: Colors.white))
                      ]),
                  SizedBox(height: 15),
                  Text('PZ chose to bat first',
                      style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            const SizedBox(height: 22),

            //********Trending Players*********//

            const Text('Trending Players ',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 19)),
            const SizedBox(height: 15),
            const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TrendingPlayerWidget(
                      imagePath: 'assets/images/players_images/Babar.jpg',
                      playerName: 'Babar',
                      playerRole: "Batter"),
                  TrendingPlayerWidget(
                      imagePath: 'assets/images/players_images/Naseem.jpg',
                      playerName: 'Naseem',
                      playerRole: "Bowler"),
                  TrendingPlayerWidget(
                      imagePath: 'assets/images/players_images/Rizwan.jpg',
                      playerName: 'Rizwan',
                      playerRole: "Batter"),
                  TrendingPlayerWidget(
                      imagePath: 'assets/images/players_images/Shaheen.jpg',
                      playerName: 'Shaheen',
                      playerRole: "Bowler"),
                ]),
            const SizedBox(height: 25),

            //**************** Top Stories Section ******************//

            const Text('Top Stories ',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 19)),
            const SizedBox(height: 10),
            const TopStoriesWidget(
                imagePath: 'assets/images/players_images/Babar.jpg',
                storyHeading: 'Babar Century',
                storyText:
                    'Today Babar Azam scored 112 run against Zimbabwe and performed very well.'),
            const SizedBox(height: 10),
            const TopStoriesWidget(
                imagePath: 'assets/images/players_images/Shaheen.jpg',
                storyHeading: 'Shaheen Fifer',
                storyText:
                    'Today Shaheen took 5 wickets against zimbabwe in 4 overs with one maiden over'),
          ],
        ),
      ),
    );
  }
}

class TrendingPlayerWidget extends StatelessWidget {
  final String imagePath;
  final String playerName;
  final String playerRole;

  const TrendingPlayerWidget(
      {super.key,
      required this.imagePath,
      required this.playerName,
      required this.playerRole});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(45),
          child: Image.asset(
            imagePath,
            height: Get.height * .1,
            width: Get.width * .22,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          playerName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          playerRole,
          style: const TextStyle(),
        ),
      ],
    );
  }
}

class TopStoriesWidget extends StatelessWidget {
  final String imagePath;
  final String storyHeading;
  final String storyText;

  const TopStoriesWidget(
      {super.key,
      required this.imagePath,
      required this.storyHeading,
      required this.storyText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        color: socondaryColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Image.asset(
            imagePath,
            height: Get.height * .14,
            width: Get.width * .3,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 5),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  storyHeading,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  storyText,
                  softWrap: true,
                  overflow: TextOverflow.visible,
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
