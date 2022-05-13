import 'package:bmi/constants/constant.dart';
import 'package:bmi/views/bmi_result_screen.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BmiDataScreen extends StatefulWidget {
  const BmiDataScreen({Key? key}) : super(key: key);

  @override
  State<BmiDataScreen> createState() => _BmiDataScreenState();
}

enum Gender { cowok, cewek }

class _BmiDataScreenState extends State<BmiDataScreen> {
  // variabel slider
  int tinggi = 120;
  int berat = 60;
  int umur = 20;

  Gender? pilihGender;

  // function hitung
  double calculateBmi() {
    // perhitungan sekaligus konversi tinggi dari centimeter ke meter
    final perhitungan = berat / (pow(tinggi / 100, 2));

    return perhitungan;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        leading: Icon(FontAwesomeIcons.gauge),
        title: Text("BMI Kalkulator"),
      ),
      body: Column(
        // column
        children: [
          Expanded(
            child: Row(
              // row
              children: const [
                Expanded(
                  child: BmiCard(
                    child: GenderIconText(
                      icon: Icons.male,
                      title: 'Laki-laki',
                    ),
                  ),
                ),
                Expanded(
                  child: BmiCard(
                    child: GenderIconText(
                      icon: Icons.female,
                      title: 'Perempuan',
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Second Column
          Expanded(
            child: Container(
              child: BmiCard(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "TINGGI",
                      style: labelTextStyle.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          "$tinggi",
                          style: numberTextStyle,
                        ),
                        Text(
                          "cm",
                          style: labelTextStyle,
                        ),
                      ],
                    ),
                    Slider(
                      value: tinggi.toDouble(),
                      min: 100,
                      max: 200,
                      activeColor: Color(0xffEFEFEF),
                      thumbColor: Color(0xffec3c66),
                      onChanged: (value) {
                        tinggi = value.toInt();
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Third Column
          Expanded(
            child: Container(
              child: Row(
                children: [
                  Expanded(
                    child: BmiCard(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "BERAT",
                            style: numberTextStyle.copyWith(
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Text(
                            "$berat",
                            style: numberTextStyle,
                          ),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RawMaterialButton(
                                onPressed: () {
                                  setState(() {
                                    if (berat >= 250) {
                                      berat = 250;
                                    } else {
                                      berat += 1;
                                    }
                                  });
                                },
                                elevation: 0,
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                                shape: CircleBorder(),
                                fillColor: Colors.white24,
                                constraints: BoxConstraints.tightFor(
                                  width: 50,
                                  height: 50,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RawMaterialButton(
                                onPressed: () {
                                  setState(() {
                                    if (berat <= 0) {
                                      berat = 0;
                                    } else {
                                      berat -= 1;
                                    }
                                  });
                                },
                                elevation: 0,
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
                                shape: CircleBorder(),
                                fillColor: Colors.white24,
                                constraints: BoxConstraints.tightFor(
                                  width: 50,
                                  height: 50,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: BmiCard(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "UMUR",
                            style: numberTextStyle.copyWith(
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Text(
                            "$umur",
                            style: numberTextStyle,
                          ),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RawMaterialButton(
                                onPressed: () {
                                  setState(() {
                                    if (umur >= 100) {
                                      umur = 100;
                                    } else {
                                      umur += 1;
                                    }
                                  });
                                },
                                elevation: 0,
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                                shape: CircleBorder(),
                                fillColor: Colors.white24,
                                constraints: BoxConstraints.tightFor(
                                  width: 50,
                                  height: 50,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RawMaterialButton(
                                onPressed: () {
                                  setState(() {
                                    if (umur <= 0) {
                                      umur = 0;
                                    } else {
                                      umur -= 1;
                                    }
                                  });
                                },
                                elevation: 0,
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
                                shape: CircleBorder(),
                                fillColor: Colors.white24,
                                constraints: BoxConstraints.tightFor(
                                  width: 50,
                                  height: 50,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) {
                    return BmiResultScreen(
                      bmi: calculateBmi(),
                    );
                  }),
                ),
              );
            },
            child: Container(
              height: 80,
              color: Color(0xffec3c66),
              child: Center(
                child: Text(
                  "Hitung BMI",
                  style: labelTextStyle.copyWith(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

// Card
class BmiCard extends StatelessWidget {
  const BmiCard({
    Key? key,
    this.child,
  }) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(58, 62, 103, 1),
          borderRadius: BorderRadius.circular(15),
        ),
        margin: EdgeInsets.all(15),
        child: child);
  }
}

// gender
class GenderIconText extends StatelessWidget {
  const GenderIconText({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
          color: Colors.white,
        ),
        const SizedBox(height: 15),
        Text(title, style: labelTextStyle),
      ],
    );
  }
}
