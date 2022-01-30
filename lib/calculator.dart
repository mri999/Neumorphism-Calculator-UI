import 'package:calculator/neo_container.dart';
import 'package:flutter/material.dart';

const Color colorDark = Color(0xFF374352);
const Color colorLight = Color(0xFFe6eeff);

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkMode ? colorDark : colorLight,
      body: Container(
        padding: const EdgeInsets.all(60),
        child: Column(
          children: [
            Center(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isDarkMode = !isDarkMode;
                  });
                },
                child: _switchMode(),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _switchMode() {
    return NeoContainer(
      darkMode: isDarkMode,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      borderRadius: BorderRadius.circular(60),
      child: Container(
        width: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.wb_sunny,
              color: isDarkMode ? Colors.grey : Colors.redAccent,
            ),
            Icon(
              Icons.nightlight_round,
              color: isDarkMode ? Colors.green : Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}
