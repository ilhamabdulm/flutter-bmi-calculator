import 'package:flutter/material.dart';

getColors(double bmi) {
  if (bmi < 18.5) {
    return Color.fromARGB(255, 101, 179, 243);
  } else if (bmi < 25) {
    return Color.fromARGB(255, 50, 224, 35);
  } else if (bmi < 40) {
    return Colors.orange;
  } else {
    return Color.fromARGB(255, 216, 37, 24);
  }
}

getBMIStatus(double bmi) {
  if (bmi < 18.5) {
    return "Underweight";
  } else if (bmi < 25) {
    return "Normal";
  } else if (bmi < 40) {
    return "Overweight";
  } else {
    return "Obese";
  }
}
