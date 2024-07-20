import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fl_chart/fl_chart.dart';

class WorkoutPage extends StatefulWidget {
  const WorkoutPage({super.key});

  @override
  State<WorkoutPage> createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  final List<int> steps = [10000, 5000, 7000, 10000, 15000, 20000, 25000];
  final List<String> days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 80.0, left: 20.0, right: 20.0),
              child: Row(
                children: [
                  Text(
                    "PROGRESS",
                    style: GoogleFonts.lato(
                      fontSize: 30,
                      color: Colors.white,
                      letterSpacing: 1.2,
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: 37,
                    height: 37,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        width: 2,
                        color: Color(0xFFE0DCC8),
                      ),
                      image: DecorationImage(
                        image: AssetImage("assets/images/w4.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Divider(
                color: Color(0xFFE0DCC8),
                thickness: 0.3,
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "15,160",
                    style: GoogleFonts.lato(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "TODAY'S GOAL",
                        style: GoogleFonts.lato(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "6,000",
                        style: GoogleFonts.lato(
                          fontSize: 16,
                          color: Color(0XFF00A3A3),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Divider(
                color: Color(0xFFE0DCC8),
                thickness: 0.3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  Icon(
                    Icons.horizontal_split,
                    color: Color(0xff007575),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "FACT",
                    style: GoogleFonts.lato(
                      fontSize: 12,
                      color: Colors.grey,
                      letterSpacing: 1.5,
                    ),
                  ),
                  SizedBox(width: 20),
                  Icon(
                    Icons.line_axis_outlined,
                    color: Color(0xff007575),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "GOAL",
                    style: GoogleFonts.lato(
                      fontSize: 12,
                      color: Colors.grey,
                      letterSpacing: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
              child: SizedBox(
                height: 200,
                child: BarChart(
                  BarChartData(
                    alignment: BarChartAlignment.spaceBetween,
                    maxY: 30000,
                    barTouchData: BarTouchData(
                      enabled: true,
                      touchTooltipData: BarTouchTooltipData(

                        getTooltipItem: (group, groupIndex, rod, rodIndex) {
                          return BarTooltipItem(
                            '${rod.toY}',
                            TextStyle(color: Colors.black),
                          );
                        },
                      ),

                    ),
                    titlesData: FlTitlesData(
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: true, reservedSize: 40),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (double value, TitleMeta meta) {
                            return SideTitleWidget(
                              axisSide: meta.axisSide,
                              child: Text(days[value.toInt()], style: TextStyle(color: Colors.white)),
                            );
                          },
                        ),
                      ),
                    ),
                    borderData: FlBorderData(show: false),
                    barGroups: steps
                        .asMap()
                        .map((index, value) => MapEntry(
                        index,
                        BarChartGroupData(x: index, barRods: [
                          BarChartRodData(
                              toY: value.toDouble(),
                              color: Color(0xff007575))
                        ])))
                        .values
                        .toList(),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Divider(
                color: Color(0xFFE0DCC8),
                thickness: 0.3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "STEPS",
                    style: GoogleFonts.lato(
                      fontSize: 14,
                      color: Colors.grey,
                      letterSpacing: 1.5,
                    ),
                  ),
                  Text(
                    "CALORIES",
                    style: GoogleFonts.lato(
                      fontSize: 14,
                      color: Colors.grey,
                      letterSpacing: 1.5,
                    ),
                  ),
                  Text(
                    "EXCERCISES",
                    style: GoogleFonts.lato(
                      fontSize: 14,
                      color: Colors.grey,
                      letterSpacing: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "5,440",
                        style: GoogleFonts.lato(
                          fontSize: 15,
                          color: Color(0xff007575),
                          letterSpacing: 1.5,
                        ),
                      ),
                      Text(
                        "402",
                        style: GoogleFonts.lato(
                          fontSize: 15,
                          color: Color(0xff007575),
                          letterSpacing: 1.5,
                        ),
                      ),
                      Text(
                        "57 MIN",
                        style: GoogleFonts.lato(
                          fontSize: 15,
                          color: Color(0xff007575),
                          letterSpacing: 1.5,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Divider(
                color: Color(0xFFE0DCC8),
                thickness: 0.3,
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff007575),
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  )
                ),
                child: Text(
                  "BACK",
                  style: GoogleFonts.lato(
                    fontSize: 16,
                    color: Colors.white,
                    letterSpacing: 1.8,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
