import 'dart:math';
import 'package:bmi/constants/constant.dart';

class BmiCalculator {
  // field
  int? tinggi;
  int? berat;
  double? bmi;
  String? bmiCategory;
  String? bmiDescription;

  // constructor
  BmiCalculator({required this.tinggi, required this.berat});
  BmiCalculator.fromBmiValue(this.bmi) {
    // this.bmi = bmi;
  }

  // perhitungan sekaligus konversi tinggi dari centimeter ke meter
  double calculateBmi() {
    bmi = berat! / (pow(tinggi! / 100, 2));

    return bmi!;
  }

  // kategori
  String determineBmiCategory() {
    String category = "";
    if (bmi! < 16.0) {
      category = underWeightSevere;
    } else if (bmi! < 17) {
      category = underWeightModerete;
    } else if (bmi! < 18.5) {
      category = underWeightMild;
    } else if (bmi! < 25) {
      category = normal;
    } else if (bmi! < 30) {
      category = overweight;
    } else if (bmi! < 35) {
      category = obeseI;
    } else if (bmi! < 40) {
      category = obeseII;
    } else if (bmi! >= 40) {
      category = obeseIII;
    }

    bmiCategory = category;

    return bmiCategory!;
  }

  // Keterangan Kategori
  String getHealthRiskDescription() {
    String desc = "";

    switch (bmiCategory!) {
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

    bmiDescription = desc;

    return bmiDescription!;
  }
}
