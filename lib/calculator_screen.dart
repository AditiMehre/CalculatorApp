import 'package:flutter/material.dart';

import 'button_values.dart';
import 'colors.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String number1 = ""; //0-9
  String number2 = ""; //0-9
  String operand = ""; // +,-,*,/
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          // OUTPUTS/Zero
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              reverse: true,
              child: Container(
                padding: const EdgeInsets.all(16),
                alignment: Alignment.bottomRight,
                child: Text(
                  "$number1$operand$number2".isEmpty
                      ? "0"
                      : "$number1$operand$number2",
                  style: const TextStyle(
                      fontSize: 48, fontWeight: FontWeight.bold),

                  //cals
                ),
              ),
            ),
          ),
          // INPUTS/BUTTONS
          Expanded(
            flex: 1,
            child: Wrap(
              children: Btn.buttonValues
                  .map(
                    (value) => SizedBox(
                      height: screenSize.width / 5,
                      width: value == Btn.n0
                          ? screenSize.width / 2
                          : (screenSize.width / 4),
                      child: buildButton(value),
                    ),
                  )
                  .toList(),
            ),
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }

  Widget buildButton(String value) {
    // value will be "D' , "c" , etc ..
    Color buttonColor = buttonColors[value] ?? Colors.white;
    return Material(
      clipBehavior: Clip.hardEdge,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: ElevatedButton(
          onPressed: () {
            onBtnTap(value);
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(buttonColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(120.0),
              ),
            ),
            elevation: MaterialStateProperty.all<double>(5.0),
          ),
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  void onBtnTap(value) {
    if (value == Btn.del) {
      delete();
      return;
    }
    if (value == Btn.clr) {
      clearAll();
      return;
    }
    if (value == Btn.per) {
      convertToPercentage();
      return;
    }
    if (value == Btn.calculate) {
      calculate();
      return;
    }
    appendValue(value);
  }

//calculation the result
  calculate() {
    if (number1.isEmpty) return;
    if (operand.isEmpty) return;
    if (number2.isEmpty) return;
    double num1 = double.parse(number1);
    double num2 = double.parse(number2);
    var res = 0.0;
    switch (operand) {
      case Btn.add:
        res = num1 + num2;
        break;
      case Btn.subtract:
        res = num1 - num2;
        break;
      case Btn.multiply:
        res = num1 * num2;
        break;
      case Btn.divide:
        if (num2 != 0) {
          res = num1 / num2;
        } else {
          // Handle division by zero
          res = double.infinity; // or any other way you wish to represent an undefined result
        }
        break;
      default:
    }
    setState(() {
      number1 = "$res";
      if (number1.endsWith(".0")) {
        number1 = number1.substring(0, number1.length - 2);
      }
      operand = "";
      number2 = "";
    });
  }

  //PercentageHandler
  void convertToPercentage() {
    if (number1.isNotEmpty && operand.isNotEmpty && number2.isNotEmpty) {
      // TODO: Calculate before conversion
      calculate();
    } else if (operand.isEmpty && number1.isNotEmpty) {
      final number = double.tryParse(number1);
      if (number != null) {
        setState(() {
          number1 = "${(number / 100)}";
          operand = "";
          number2 = "";
        });
      }
    }
  }

  //clear all button
  void clearAll() {
    number1 = "";
    number2 = "";
    operand = "";
    setState(() {});
  }

  //delete one from the end
  void delete() {
    if (number2.isNotEmpty) {
      number2 = number2.substring(0, number2.length - 1);
    } else if (operand.isNotEmpty) {
      operand = "";
    } else if (number1.isNotEmpty) {
      number1 = number1.substring(0, number1.length - 1);
    }
    setState(() {});
  }

  void appendValue(String value) {
    // number1 opernad number2
    // 234       +      5343
    // if is operand and not "."
    if (value != Btn.dot && int.tryParse(value) == null) {
      // operand pressed
      if (operand.isNotEmpty && number2.isNotEmpty) {
        // TODO calculate the equation before assigning new operand
        calculate();
      }
      operand = value;
    }
    // assign value to number1 variable
    else if (number1.isEmpty || operand.isEmpty) {
      // check if value is "." | ex: number1 = "1.2"
      if (value == Btn.dot && number1.contains(Btn.dot)) return;
      if (value == Btn.dot && (number1.isEmpty || number1 == Btn.n0)) {
        // ex: number1 = "" | "0"
        value = "0.";
      }
      number1 += value;
    }
    // assign value to number2 variable
    else if (number2.isEmpty || operand.isNotEmpty) {
      // check if value is "." | ex: number1 = "1.2"
      if (value == Btn.dot && number2.contains(Btn.dot)) return;
      if (value == Btn.dot && (number2.isEmpty || number2 == Btn.n0)) {
        // number1 = "" | "0"
        value = "0.";
      }
      number2 += value;
    }

    setState(() {});
  }
}
