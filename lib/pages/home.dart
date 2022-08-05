import 'package:bmi_calculator/models/weight.dart';
import 'package:flutter/material.dart';

import '../widgets/input_number.dart';
import '../utils/calculator.dart';

import '../pages/detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _height = TextEditingController();
  final TextEditingController _weight = TextEditingController();
  final TextEditingController _age = TextEditingController();

  String gender = '';

  _clearState() {
    setState(() {
      _age.clear();
      _height.clear();
      _weight.clear();
      gender = '';
    });
  }

  _setGender(String sex) {
    setState(() {
      gender = sex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
              padding: const EdgeInsets.all(16),
              child: ListView(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 24),
                    child: const Text(
                      "BMI Calculator",
                      style: TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  NumberInput(
                    label: 'Height',
                    suffixText: 'cm',
                    controller: _height,
                  ),
                  NumberInput(
                    label: 'Weight',
                    suffixText: 'kg',
                    controller: _weight,
                  ),
                  NumberInput(
                    label: 'Age',
                    suffixText: '',
                    controller: _age,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Gender"),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: InkWell(
                                    onTap: () {
                                      _setGender('Male');
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      height: 80,
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(8)),
                                          border: Border.all(
                                              width: gender == 'Male' ? 3 : 1,
                                              color: gender == 'Male'
                                                  ? Colors.green
                                                  : Colors.black)),
                                      child: const Center(
                                        child: Text("Male"),
                                      ),
                                    ),
                                  )),
                              const SizedBox(
                                width: 12,
                              ),
                              Expanded(
                                  flex: 1,
                                  child: InkWell(
                                    onTap: () {
                                      _setGender('Female');
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      height: 80,
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(8)),
                                          border: Border.all(
                                              width: gender == 'Female' ? 3 : 1,
                                              color: gender == 'Female'
                                                  ? Colors.green
                                                  : Colors.black)),
                                      child: const Center(
                                        child: Text("Female"),
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Container(
                              height: 45,
                              child: OutlinedButton(
                                  onPressed: () {
                                    _clearState();
                                  },
                                  child: const Text('Reset')))),
                      const SizedBox(
                        width: 24,
                      ),
                      Expanded(
                          flex: 1,
                          child: Container(
                              height: 45,
                              child: ElevatedButton(
                                  onPressed: () {
                                    if (_height.text != '' &&
                                        _weight.text != '' &&
                                        _age.text != '' &&
                                        gender != '') {
                                      double heightNumber =
                                          double.parse(_height.text);
                                      double weightNumber =
                                          double.parse(_weight.text);

                                      String result = _height.text != '' &&
                                              _weight.text != ''
                                          ? calculateBMI(
                                              heightNumber, weightNumber)
                                          : "0";

                                      NormalWeight resultNormal =
                                          getNormalWeight(heightNumber);

                                      Navigator.of(context)
                                          .push(PageRouteBuilder(
                                        pageBuilder: (context, animation,
                                                secondaryAnimation) =>
                                            DetailPage(
                                          age: _age.text,
                                          weight: _weight.text,
                                          height: _height.text,
                                          result: double.parse(result),
                                          resultNormal: resultNormal,
                                        ),
                                        transitionsBuilder: (context, animation,
                                            secondaryAnimation, child) {
                                          const begin = Offset(0.0, 1.0);
                                          const end = Offset.zero;
                                          const curve = Curves.ease;

                                          var tween = Tween(
                                                  begin: begin, end: end)
                                              .chain(CurveTween(curve: curve));

                                          return SlideTransition(
                                            position: animation.drive(tween),
                                            child: child,
                                          );
                                        },
                                      ));
                                      _clearState();
                                    }
                                  },
                                  child: const Text('Calculate')))),
                    ],
                  ),
                ],
              ))),
    );
  }
}
