import 'package:bmi/constants/constant.dart';
import 'package:bmi/helpers/bmi_calculator.dart';
import 'package:bmi/views/bmi_result_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  String? gender;

  Gender? pilihGender;

  List<Widget> generateList(start, end) {
    List<Widget> beratA = [];
    for (var i = start; i <= end; i++) {
      beratA.add(
        Text(
          "$i",
          style: labelTextStyle.copyWith(
            fontSize: 20,
          ),
        ),
      );
    }

    return beratA;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: primaryColor,
      appBar: AppBar(
        leading: const Icon(
          FontAwesomeIcons.gauge,
          color: primaryColor,
        ),
        elevation: 0,
        title: const Text("BMI Kalkulator"),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          // panggil class bmiCalculator
          final bmiCalculator = BmiCalculator(tinggi: tinggi, berat: berat);
          bmiCalculator.calculateBmi(); // constructor

          Navigator.of(context).push(
            MaterialPageRoute(
              builder: ((context) {
                return BmiResultScreen(
                  bmi: bmiCalculator.bmi!,
                );
              }),
            ),
          );
        },
        child: Container(
          height: 60,
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: const Color(0xff517df6),
              borderRadius: BorderRadius.circular(8)),
          child: Center(
            child: Text(
              "Hitung BMI",
              style: labelTextStyle.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          // column
          children: [
            Row(
              // row
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        gender = "cowok";
                      });
                    },
                    child: BmiCard(
                      borderColor: (gender == "cowok")
                          ? Color(0xff517df6)
                          : primaryColor,
                      child: Stack(
                        children: [
                          const Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 20.0,
                              ),
                              child: GenderIconText(
                                icon: Icons.male,
                                title: 'Laki-laki',
                              ),
                            ),
                          ),
                          Positioned(
                            top: 10,
                            right: 10,
                            child: Icon(
                              Icons.check_circle,
                              color: (gender == "cowok")
                                  ? Color(0xff517df6)
                                  : Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        gender = "cewek";
                      });
                    },
                    child: BmiCard(
                      borderColor: (gender == "cewek")
                          ? Color(0xff517df6)
                          : primaryColor,
                      child: Stack(
                        children: [
                          const Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 20.0,
                              ),
                              child: GenderIconText(
                                icon: Icons.female,
                                title: 'Perempuan',
                              ),
                            ),
                          ),
                          Positioned(
                            top: 10,
                            right: 10,
                            child: Icon(
                              Icons.check_circle,
                              color: (gender == "cewek")
                                  ? Color(0xff517df6)
                                  : Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),

            // Second Column
            Column(
              children: [
                Text(
                  "TINGGI",
                  style: labelTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: BmiCard(
                        child: Slider(
                          value: tinggi.toDouble(),
                          min: 100,
                          max: 200,
                          activeColor: primaryColor,
                          thumbColor: const Color(0xffec3c66),
                          onChanged: (value) {
                            setState(() {
                              tinggi = value.toInt();
                            });
                          },
                        ),
                      ),
                    ),
                    BmiCard(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10.0,
                          vertical: 10.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              "$tinggi",
                              style: labelTextStyle.copyWith(
                                fontSize: 30,
                              ),
                            ),
                            Text(
                              " cm",
                              style: labelTextStyle.copyWith(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),

            // Third Column
            Container(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          "BERAT",
                          style: numberTextStyle.copyWith(
                            fontSize: 20,
                          ),
                        ),
                        BmiCard(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.15,
                                  child: CupertinoPicker(
                                    scrollController:
                                        FixedExtentScrollController(
                                            initialItem: 30),
                                    itemExtent: 25,
                                    magnification: 2,
                                    useMagnifier: true,
                                    onSelectedItemChanged: (val) {
                                      berat = val + 20;
                                    },
                                    children: generateList(20, 220),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          "UMUR",
                          style: numberTextStyle.copyWith(
                            fontSize: 20,
                          ),
                        ),
                        BmiCard(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.15,
                                  child: CupertinoPicker(
                                    scrollController:
                                        FixedExtentScrollController(
                                            initialItem: 5),
                                    itemExtent: 25,
                                    magnification: 2,
                                    useMagnifier: true,
                                    onSelectedItemChanged: (val) {
                                      umur = val + 20;
                                    },
                                    children: generateList(15, 90),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Card
class BmiCard extends StatelessWidget {
  const BmiCard({
    Key? key,
    this.child,
    this.borderColor = Colors.white,
  }) : super(key: key);

  final Widget? child;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(-2, 2),
              blurRadius: 10,
              color: Colors.black.withOpacity(0.2),
            ),
          ],
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: borderColor!),
        ),
        margin: const EdgeInsets.all(15),
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
          color: primaryColor,
        ),
        const SizedBox(height: 15),
        Text(title, style: labelTextStyle),
      ],
    );
  }
}
