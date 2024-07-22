import 'package:cricket_world/view/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: socondaryColor,
          title: const Text('Cricket World',
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white))),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Articles',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 15),
              TopStoriesWidget(
                  imagePath: 'assets/images/players_images/Naseem.jpg',
                  storyHeading: 'Naseem Shah 4 wkts',
                  storyText:
                      'In today match Naseem Shah the fast bowler took 4 wickets and took the man of the match'),
              SizedBox(height: 20),
              TopStoriesWidget(
                  imagePath: 'assets/images/players_images/Shadab.jpg',
                  storyHeading: 'Shadab Khan 5 wickets',
                  storyText:
                      'In today match, Shadab Khan, the spin bowler, claimed 5 wickets and earned the man of the match'),
              SizedBox(height: 20),
              TopStoriesWidget(
                  imagePath: 'assets/images/players_images/Saim.jpg',
                  storyHeading: 'Rising Star Saim Ayub',
                  storyText:
                      'In today match, Saim Ayub, the opening batter, scored a swift century and took the man of the match'),
              SizedBox(height: 20),
              TopStoriesWidget(
                  imagePath: 'assets/images/players_images/RashidKhan.jpg',
                  storyHeading: 'King Rashid Khan',
                  storyText:
                      'In today match, Rashid Khan, the allrounder, scored 50 runs and took 3 wickets, earning the man of the match.'),
              SizedBox(height: 20),
              TopStoriesWidget(
                  imagePath: 'assets/images/players_images/Iftikhar.jpg',
                  storyHeading: 'Iftikhar Chacha 78',
                  storyText:
                      'In today match, Ifti Chacha, the skilled batter, hit a thrilling 75 runs and clinched the man of the match'),
              SizedBox(height: 20),
              TopStoriesWidget(
                  imagePath: 'assets/images/players_images/Babar.jpg',
                  storyHeading: 'Babar Azam 90 runs',
                  storyText:
                      'In today match, Babar Azam, the skilled batter, hit a thrilling 90 not out to lead his team to victory.'),
              SizedBox(height: 20),
              TopStoriesWidget(
                  imagePath: 'assets/images/players_images/Rizwan.jpg',
                  storyHeading: 'Rizwan Qualifying Fifty',
                  storyText:
                      'In yesterday game, Rizwan, the opener, smashed a quickfire fifty, setting the pace for his teams victory.'),
            ],
          ),
        ),
      ),
    );
  }
}
