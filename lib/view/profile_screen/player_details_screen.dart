import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';

class PlayerDetailsScreen extends StatefulWidget {
  final String team1;
  final String team2;
  final String playerRole;
  final String battingStyle;
  final String bowlingStyle;
  final String playerDOB;
  final String playerName;
  final String playerImage;
  final int playerAge;
  const PlayerDetailsScreen(
      {super.key,
      required this.playerName,
      required this.playerImage,
      required this.playerAge,
      required this.battingStyle,
      required this.bowlingStyle,
      required this.playerDOB,
      required this.playerRole,
      required this.team1,
      required this.team2});

  @override
  State<PlayerDetailsScreen> createState() => _PlayerDetailsScreenState();
}

class _PlayerDetailsScreenState extends State<PlayerDetailsScreen> {
  late String selectedTab = 'Teams';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: socondaryColor,
        title: const Text(
          'Players Details',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              _buildPlayerHeader(),
              const SizedBox(height: 20),
              _buildStatsRow(),
              const SizedBox(height: 20),
              _buildTabRow(),
              const SizedBox(height: 20),
              _buildContentForSelectedTab(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlayerHeader() {
    return Align(
      alignment: Alignment.center,
      child: Column(
        children: [
          Container(
            width: Get.width * .3,
            height: Get.height * .133,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                widget.playerImage,
                height: Get.height * .13,
                width: Get.width * .3,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(widget.playerName,
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const Text('Pakistan', style: TextStyle(fontSize: 20)),
          Text('${widget.playerAge} Years',
              style: const TextStyle(fontSize: 16))
        ],
      ),
    );
  }

  Widget _buildStatsRow() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            PlayerDetailsWidget(
              heading: 'Born',
              subheading: widget.playerDOB,
            ),
            PlayerDetailsWidget(
              heading: 'Player Role',
              subheading: widget.playerRole,
            ),
          ],
        ),
        const SizedBox(height: 5),
        Container(width: Get.width * .8, height: 1, color: Colors.white10),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            PlayerDetailsWidget(
              heading: 'Batting Style',
              subheading: widget.battingStyle,
            ),
            PlayerDetailsWidget(
              heading: 'Bowling Style',
              subheading: widget.bowlingStyle,
            ),
          ],
        ),
        const SizedBox(height: 5),
        Container(width: Get.width * .8, height: 1, color: Colors.white10),
        const SizedBox(height: 10)
      ],
    );
  }

  Widget _buildTabRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildTabContainer('Teams'),
        _buildTabContainer('Records'),
        _buildTabContainer('Stats'),
        _buildTabContainer('Matches'),
      ],
    );
  }

  Widget _buildTabContainer(String tabName) {
    bool isSelected = selectedTab == tabName;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTab = tabName;
        });
      },
      child: Container(
        width: Get.width * .2,
        height: Get.height * .057,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: isSelected ? socondaryColor : Colors.transparent,
        ),
        child: Center(
          child: Text(
            tabName,
            style: TextStyle(
                color: isSelected ? Colors.white : Colors.white70,
                fontSize: 16),
          ),
        ),
      ),
    );
  }

  Widget _buildContentForSelectedTab() {
    switch (selectedTab) {
      case 'Teams':
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
          decoration: BoxDecoration(
              color: socondaryColor, borderRadius: BorderRadius.circular(20)),
          width: Get.width,
          height: Get.height * .28,
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text('Team 1', style: TextStyle(fontSize: 18)),
                Text(widget.team1, style: const TextStyle(fontSize: 18))
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text('Team 2', style: TextStyle(fontSize: 18)),
                Text(widget.team2, style: const TextStyle(fontSize: 18))
              ],
            )
          ]),
        );
      case 'Records':
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: BoxDecoration(
              color: socondaryColor, borderRadius: BorderRadius.circular(20)),
          width: Get.width,
          height: Get.height * .28,
          child: Column(children: [
            Row(children: [
              Container(
                width: Get.width * .1,
                height: Get.height * .045,
                decoration: BoxDecoration(
                    color: Colors.black45,
                    borderRadius: BorderRadius.circular(25)),
                child: const Center(child: Text('1')),
              ),
              const SizedBox(width: 7),
              const Text('Most Runs in an Inning: 54',
                  style: TextStyle(fontSize: 18))
            ]),
            const SizedBox(height: 8),
            Row(children: [
              Container(
                width: Get.width * .1,
                height: Get.height * .045,
                decoration: BoxDecoration(
                    color: Colors.black45,
                    borderRadius: BorderRadius.circular(25)),
                child: const Center(child: Text('2')),
              ),
              const SizedBox(width: 7),
              const Text('Most Runs in an Inning: 54',
                  style: TextStyle(fontSize: 18))
            ]),
            const SizedBox(height: 8),
            Row(children: [
              Container(
                width: Get.width * .1,
                height: Get.height * .045,
                decoration: BoxDecoration(
                    color: Colors.black45,
                    borderRadius: BorderRadius.circular(25)),
                child: const Center(child: Text('3')),
              ),
              const SizedBox(width: 7),
              const Text('Most Runs in an Inning: 54',
                  style: TextStyle(fontSize: 18))
            ])
          ]),
        );
      case 'Stats':
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          decoration: BoxDecoration(
              color: socondaryColor, borderRadius: BorderRadius.circular(20)),
          width: Get.width,
          height: Get.height * .28,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //********** Career Results Section ************//

                      Column(children: [
                        const Text('Career Results',
                            style: TextStyle(fontSize: 18)),
                        Row(
                          children: [
                            const Column(
                              children: [
                                Text('Mat'),
                                Text('3'),
                              ],
                            ),
                            const SizedBox(width: 4),
                            Container(
                              width: 1,
                              height: Get.height * .043,
                              color: Colors.white24,
                            ),
                            const SizedBox(width: 4),
                            const Column(
                              children: [
                                Text('Inns'),
                                Text('3'),
                              ],
                            ),
                            const SizedBox(width: 4),
                            Container(
                              width: 1,
                              height: Get.height * .043,
                              color: Colors.white24,
                            ),
                            const SizedBox(width: 4),
                            const Column(
                              children: [
                                Text('Run'),
                                Text('123'),
                              ],
                            ),
                            const SizedBox(width: 4),
                            Container(
                              width: 1,
                              height: Get.height * .043,
                              color: Colors.white24,
                            ),
                            const SizedBox(width: 4),
                            const Column(
                              children: [
                                Text('Avg'),
                                Text('41'),
                              ],
                            ),
                            const SizedBox(width: 4),
                            Container(
                              width: 1,
                              height: Get.height * .043,
                              color: Colors.white24,
                            ),
                            const SizedBox(width: 4),
                            const Column(
                              children: [
                                Text('HS'),
                                Text('78'),
                              ],
                            ),
                          ],
                        )
                      ]),

                      //********** Overview Section ************//

                      Column(children: [
                        const Text('Overview', style: TextStyle(fontSize: 18)),
                        Row(
                          children: [
                            const Column(
                              children: [
                                Text('100s'),
                                Text('0'),
                              ],
                            ),
                            const SizedBox(width: 4),
                            Container(
                              width: 1,
                              height: Get.height * .043,
                              color: Colors.white24,
                            ),
                            const SizedBox(width: 4),
                            const Column(
                              children: [
                                Text('50s'),
                                Text('1'),
                              ],
                            ),
                            const SizedBox(width: 4),
                            Container(
                              width: 1,
                              height: Get.height * .043,
                              color: Colors.white24,
                            ),
                            const SizedBox(width: 4),
                            const Column(
                              children: [
                                Text('6s'),
                                Text('10'),
                              ],
                            ),
                          ],
                        )
                      ])
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //********** Career Results Section ************//

                      Column(children: [
                        const Text('Vs Team Avgs',
                            style: TextStyle(fontSize: 18)),
                        Row(
                          children: [
                            const Column(
                              children: [
                                Text('Mat'),
                                Text('3'),
                              ],
                            ),
                            const SizedBox(width: 4),
                            Container(
                              width: 1,
                              height: Get.height * .043,
                              color: Colors.white24,
                            ),
                            const SizedBox(width: 4),
                            const Column(
                              children: [
                                Text('Inns'),
                                Text('3'),
                              ],
                            ),
                            const SizedBox(width: 4),
                            Container(
                              width: 1,
                              height: Get.height * .043,
                              color: Colors.white24,
                            ),
                            const SizedBox(width: 4),
                            const Column(
                              children: [
                                Text('Run'),
                                Text('123'),
                              ],
                            ),
                            const SizedBox(width: 4),
                            Container(
                              width: 1,
                              height: Get.height * .043,
                              color: Colors.white24,
                            ),
                            const SizedBox(width: 4),
                            const Column(
                              children: [
                                Text('Avg'),
                                Text('41'),
                              ],
                            ),
                            const SizedBox(width: 4),
                            Container(
                              width: 1,
                              height: Get.height * .043,
                              color: Colors.white24,
                            ),
                            const SizedBox(width: 4),
                            const Column(
                              children: [
                                Text('HS'),
                                Text('78'),
                              ],
                            ),
                          ],
                        )
                      ]),

                      //********** Overview Section ************//

                      Column(children: [
                        const Text('Overview', style: TextStyle(fontSize: 18)),
                        Row(
                          children: [
                            const Column(
                              children: [
                                Text('100s'),
                                Text('0'),
                              ],
                            ),
                            const SizedBox(width: 4),
                            Container(
                              width: 1,
                              height: Get.height * .043,
                              color: Colors.white24,
                            ),
                            const SizedBox(width: 4),
                            const Column(
                              children: [
                                Text('50s'),
                                Text('1'),
                              ],
                            ),
                            const SizedBox(width: 4),
                            Container(
                              width: 1,
                              height: Get.height * .043,
                              color: Colors.white24,
                            ),
                            const SizedBox(width: 4),
                            const Column(
                              children: [
                                Text('6s'),
                                Text('10'),
                              ],
                            ),
                          ],
                        )
                      ])
                    ])
              ]),
        );
      case 'Matches':
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
              color: socondaryColor, borderRadius: BorderRadius.circular(20)),
          width: Get.width,
          height: Get.height * .28,
          child: const Column(children: [
            Text('Test Matches',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Column(
                children: [
                  Text('Debut', style: TextStyle(fontSize: 16)),
                  Text('Pak Vs Nz', style: TextStyle(fontSize: 16)),
                  Text('12/4/2023', style: TextStyle(fontSize: 16)),
                ],
              ),
              Column(children: [
                Text('Last', style: TextStyle(fontSize: 16)),
                Text('Pak Vs Nz', style: TextStyle(fontSize: 16)),
                Text('17/4/2023', style: TextStyle(fontSize: 16))
              ])
            ]),
            Divider(height: 1, color: Colors.white),
            Text('T20 Matches',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Column(
                children: [
                  Text('Debut', style: TextStyle(fontSize: 16)),
                  Text('Pak Vs Aus', style: TextStyle(fontSize: 16)),
                  Text('12/1/2023', style: TextStyle(fontSize: 16)),
                ],
              ),
              Column(children: [
                Text('Last', style: TextStyle(fontSize: 16)),
                Text('Pak Vs Nz', style: TextStyle(fontSize: 16)),
                Text('17/4/2023', style: TextStyle(fontSize: 16))
              ])
            ])
          ]),
        );
      default:
        return _customContainer("Select a tab");
    }
  }

  Widget _customContainer(String text) {
    return Container(
      color: Colors.grey[350],
      width: Get.width,
      height: Get.height * .2,
      child: Center(
        child: Text(
          text,
          style: const TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
    );
  }
}

class PlayerDetailsWidget extends StatelessWidget {
  final String heading;
  final String subheading;

  const PlayerDetailsWidget({
    super.key,
    required this.heading,
    required this.subheading,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          heading,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
        Text(subheading, style: const TextStyle(fontSize: 16)),
      ],
    );
  }
}
