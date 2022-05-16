import 'package:flutter/material.dart';

const Color primaryColor = Color(0xff0a0e21);

TextStyle labelTextStyle = const TextStyle(
  fontSize: 18,
  color: primaryColor, //Color(0xff8d8e98),
);

TextStyle numberTextStyle = const TextStyle(
    fontSize: 50, fontWeight: FontWeight.bold, color: primaryColor);

TextStyle result = const TextStyle(
    fontSize: 40, fontWeight: FontWeight.bold, color: primaryColor);

// kategori
const String underWeightSevere = "Berat Badan Kurang (Parah)";
const String underWeightModerete = "Berat Badan Kurang (Sedang)";
const String underWeightMild = "Berat Badan Kurang (Ringan)";
const String normal = "Normal";
const String overweight = "Kegemukan";
const String obeseI = "Obesitas (Kelas I)";
const String obeseII = "Obesitas (Kelas II)";
const String obeseIII = "Obesitas (Kelas III)";
