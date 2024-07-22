import 'package:cricket_world/view/charts_screen/line_chart_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';

class ChartsScreen extends StatefulWidget {
  const ChartsScreen({super.key});

  @override
  State<ChartsScreen> createState() => _ChartsScreenState();
}

class _ChartsScreenState extends State<ChartsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: socondaryColor,
          title: const Text('Charts Screen',
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white))),
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
                      Container(
                        width: Get.width * .3,
                        height: Get.height * .06,
                        decoration: BoxDecoration(
                          color: activeButtonColor,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: const Center(
                          child: Text(
                            'Details',
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
                          Get.to(const LineChartScreen());
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
                              'Graphs',
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
              const SizedBox(height: 18),
              const MatchDetailsWidget(
                  heading: 'Live, Eliminator 1, Psl 2024',
                  team1: 'LQ',
                  team1Data: '(8/20 overs 70/4)',
                  team2: 'MS',
                  team2Data: 'Target 167 runs',
                  batOrBowl: 'MS won the toss and chose to bat'),
              const SizedBox(height: 20),
              const MatchDetailsWidget(
                  heading: 'Result PZ vs IU',
                  team1: 'PZ',
                  team1Data: '(20/20 overs 178/4)',
                  team2: 'IU',
                  team2Data: '19.2/20 overs  170/8',
                  batOrBowl: 'PZ won the toss and chose to bat'),
              const SizedBox(height: 20),
              const MatchDetailsWidget(
                  heading: '2nd, T20 , Pak vs NZ',
                  team1: 'Pak',
                  team1Data: '(20/20 overs 190/7)',
                  team2: 'NZ',
                  team2Data: '(19.4/20 overs 180)',
                  batOrBowl: 'Pak won the toss and chose to bat'),
              const SizedBox(height: 20),
              const MatchDetailsWidget(
                  heading: '1st T20i Pak Vs NZ',
                  team1: 'Pak',
                  team1Data: '(19/20 overs 150)',
                  team2: 'NZ',
                  team2Data: '18/20 overs 152',
                  batOrBowl: 'Pak won the toss and chose to bat'),
            ],
          ),
        ),
      ),
    );
  }
}

class MatchDetailsWidget extends StatelessWidget {
  final String heading;
  final String team1;
  final String team1Data;
  final String team2;
  final String team2Data;
  final String batOrBowl;

  const MatchDetailsWidget(
      {super.key,
      required this.heading,
      required this.team1,
      required this.team1Data,
      required this.team2,
      required this.team2Data,
      required this.batOrBowl});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(const LineChartScreen()),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: socondaryColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [Text(heading)]),
            const SizedBox(height: 15),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text(team1), Text(team1Data)]),
            const SizedBox(height: 15),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text(team2), Text(team2Data)]),
            const SizedBox(height: 15),
            Text(batOrBowl),
          ],
        ),
      ),
    );
  }
}
