import 'package:bmi_calculator/models/weight.dart';
import 'package:bmi_calculator/utils/helpers.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final double result;
  final String height;
  final String weight;
  final String age;
  final NormalWeight resultNormal;

  const DetailPage(
      {Key? key,
      required this.age,
      required this.height,
      required this.weight,
      required this.result,
      required this.resultNormal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      body: SafeArea(
          child: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 32),
                      child: const Text(
                        'Your BMI Score Result',
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      width: 180,
                      height: 180,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: getColors(result)),
                      child: Center(
                          child: Text(
                        '$result',
                        style: const TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      )),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 32),
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'For your height, a normal weight range would be from ${resultNormal.minimum} to ${resultNormal.maximum} kilograms.',
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Text(
                            'Your BMI is $result, indicating your weight is in the ${getBMIStatus(result)} category for adults of your height',
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w300),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          const Text(
                            "Maintaining a healthy weight may reduce the risk of chronic diseases associated with overweight and obesity",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w300),
                          ),
                        ]),
                  ),
                  Flexible(
                      fit: FlexFit.loose,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                                height: 45,
                                child: ElevatedButton(
                                  onPressed: (() {
                                    Navigator.pop(context);
                                  }),
                                  child: Text("Recalculate BMI"),
                                )),
                          )
                        ],
                      ))
                ],
              )),
        ),
      )),
    ));
  }
}
