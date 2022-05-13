import 'package:bmi/constants/constant.dart';
import 'package:bmi/views/bmi_data_screen.dart';
import 'package:flutter/material.dart';

class BmiResultScreen extends StatelessWidget {
  const BmiResultScreen({Key? key, required this.bmi}) : super(key: key);

  final double bmi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hasil Hitung "),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Center(
                child: Text(
                  "Hasil Perhitungan",
                  style: result,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: BmiCard(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Normal",
                      style: result.copyWith(
                        fontSize: 25,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(
                      "${bmi.toStringAsFixed(1)}",
                      style: result.copyWith(
                        fontSize: 90,
                      ),
                    ),
                    Text(
                      "Kamu terlalu kurus, perbanyak makan.",
                      style: result.copyWith(
                        fontSize: 25,
                        fontWeight: FontWeight.normal,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 80,
              color: Color(0xffec3c66),
              child: Center(
                child: Text(
                  "Hitung Ulang",
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
