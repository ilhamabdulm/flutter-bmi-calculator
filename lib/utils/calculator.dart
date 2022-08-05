import 'package:bmi_calculator/models/weight.dart';

String calculateBMI(double height, double weight) {
  final heightInMeter = height / 100;
  final squareOfHeight = heightInMeter * heightInMeter;

  return (weight / squareOfHeight).toStringAsFixed(2);
}

getNormalWeight(double height) {
  final heightInMeter = height / 100;
  final squareOfHeight = heightInMeter * heightInMeter;
  final result = NormalWeight(
      minimum: double.parse((18.5 * squareOfHeight).toStringAsFixed(2)),
      maximum: double.parse((24.9 * squareOfHeight).toStringAsFixed(2)));

  return result;
}
