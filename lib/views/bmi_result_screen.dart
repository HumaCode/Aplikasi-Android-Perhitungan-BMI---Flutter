import 'package:bmi/constants/constant.dart';
import 'package:bmi/views/bmi_data_screen.dart';
import 'package:flutter/material.dart';

class BmiResultScreen extends StatelessWidget {
  const BmiResultScreen({Key? key, required this.bmi}) : super(key: key);

  final double bmi;

// kategori
  String determineBmiCategory(double bmiValue) {
    String category = "";
    if (bmiValue < 16.0) {
      category = underWeightSevere;
    } else if (bmiValue < 17) {
      category = underWeightModerete;
    } else if (bmiValue < 18.5) {
      category = underWeightMild;
    } else if (bmiValue < 25) {
      category = normal;
    } else if (bmiValue < 30) {
      category = overweight;
    } else if (bmiValue < 35) {
      category = obeseI;
    } else if (bmiValue < 40) {
      category = obeseII;
    } else if (bmiValue >= 40) {
      category = obeseIII;
    }

    return category;
  }

  // Keterangan Kategori
  String getHealthRiskDescription(String categoryName) {
    String desc = "";

    switch (categoryName) {
      case underWeightSevere:
      case underWeightModerete:
      case underWeightMild:
        desc = "Kemungkinan kekurangan nutrisi dan pengkroposan tulang";
        break;
      case normal:
        desc = "Resiko Rendah(Sehat)";
        break;
      case overweight:
        desc =
            "Risiko terkena penyakit jantung, tekanan darah tinggi, stroke dan diabetes militus";
        break;
      case obeseI:
      case obeseII:
      case obeseIII:
        desc =
            "Risiko tinggi terkena penyakit jantung, tekanan darah tinggi, stroke, diabetes mellitus, sindrom metabolisme";
        break;
      default:
    }

    return desc;
  }

  @override
  Widget build(BuildContext context) {
    final bmiCategory = determineBmiCategory(bmi);
    final bmiDesc = getHealthRiskDescription(bmiCategory);

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
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      bmiCategory,
                      style: result.copyWith(
                        fontSize: 25,
                        fontWeight: FontWeight.normal,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "${bmi.toStringAsFixed(1)}",
                      style: result.copyWith(
                        fontSize: 90,
                      ),
                    ),
                    Text(
                      bmiDesc,
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
