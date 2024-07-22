import 'package:cricket_world/utils/constants.dart';
import 'package:cricket_world/view/charts_screen/charts_screen.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';

class LineChartScreen extends StatelessWidget {
  const LineChartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        backgroundColor: socondaryColor,
        centerTitle: true,
        title: const Text(
          'Charts Data',
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () => Get.to(const ChartsScreen()),
                        child: Container(
                          width: Get.width * .3,
                          height: Get.height * .06,
                          decoration: BoxDecoration(
                            color: socondaryColor,
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
                      ),
                      const SizedBox(width: 10),
                      Container(
                        width: Get.width * .3,
                        height: Get.height * .06,
                        decoration: BoxDecoration(
                          color: activeButtonColor,
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
                      )
                    ],
                  ),
                  const Icon(
                    Icons.search,
                    color: Colors.white,
                  )
                ],
              ),
              Column(
                children: [
                  const Text('Team A', style: TextStyle(fontSize: 20)),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white12,
                        borderRadius: BorderRadius.circular(22)),
                    width: Get.width * 8,
                    height: Get.height * .35,
                    child: LineChart(
                      LineChartData(
                        minX: 1,
                        maxX: 10,
                        minY: 0,
                        maxY: 60,
                        gridData: const FlGridData(
                          show: true,
                          drawVerticalLine: true,
                          drawHorizontalLine: true,
                          verticalInterval: 1,
                          horizontalInterval: 5,
                        ),
                        borderData: FlBorderData(
                          show: true,
                          border: Border.all(color: Colors.yellow),
                        ),
                        lineBarsData: [
                          LineChartBarData(
                            spots: [
                              const FlSpot(1, 1),
                              const FlSpot(2, 20),
                              const FlSpot(3, 22),
                              const FlSpot(4, 25),
                              const FlSpot(5, 30),
                              const FlSpot(6, 32),
                              const FlSpot(7, 42),
                              const FlSpot(8, 50),
                              const FlSpot(9, 50),
                              const FlSpot(10, 55),
                            ],
                            isCurved: false,
                            color: Colors.blue,
                            barWidth: 2,
                            isStrokeCapRound: true,
                            dotData: const FlDotData(show: false),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  const Text('Team B', style: TextStyle(fontSize: 20)),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white12,
                        borderRadius: BorderRadius.circular(22)),
                    width: Get.width * 8,
                    height: Get.height * .35,
                    child: LineChart(
                      LineChartData(
                        minX: 1,
                        maxX: 10,
                        minY: 0,
                        maxY: 60,
                        gridData: const FlGridData(
                          show: true,
                          drawVerticalLine: true,
                          drawHorizontalLine: true,
                          verticalInterval: 1,
                          horizontalInterval: 5,
                        ),
                        borderData: FlBorderData(
                          show: true,
                          border: Border.all(color: Colors.yellow),
                        ),
                        lineBarsData: [
                          LineChartBarData(
                            spots: [
                              const FlSpot(1, 1),
                              const FlSpot(2, 15),
                              const FlSpot(3, 22),
                              const FlSpot(4, 25),
                              const FlSpot(5, 30),
                              const FlSpot(6, 32),
                              const FlSpot(7, 42),
                              const FlSpot(8, 50),
                              const FlSpot(9, 50),
                              const FlSpot(10, 55),
                            ],
                            isCurved: false,
                            color: Colors.blue,
                            barWidth: 2,
                            isStrokeCapRound: false,
                            dotData: const FlDotData(show: true),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
