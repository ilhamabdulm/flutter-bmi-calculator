import 'package:flutter/material.dart';

class NumberInput extends StatelessWidget {
  final String label;
  final String suffixText;
  final TextEditingController controller;

  const NumberInput(
      {Key? key,
      required this.label,
      required this.suffixText,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
                height: 45,
                alignment: Alignment.center,
                child: TextFormField(
                  controller: controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      suffix: Align(
                          widthFactor: 1.0,
                          heightFactor: 1.0,
                          child: Text(
                            suffixText,
                            style: const TextStyle(fontSize: 18),
                          )),
                      label: Text(
                        label,
                      ),
                      // labelStyle: TextStyle(color: Colors.red),
                      enabledBorder: OutlineInputBorder(
                        // borderSide: const BorderSide(
                        //     width: 3,
                        //     color: Color.fromARGB(255, 176, 238, 178)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 3, color: Colors.green),
                        borderRadius: BorderRadius.circular(8),
                      )),
                )),
          ),
        ],
      ),
    ));
  }
}
