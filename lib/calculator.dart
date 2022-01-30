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
      body: SafeArea(
        child: Container(
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
              ),
              const SizedBox(
                height: 70,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                alignment: Alignment.centerRight,
                child: Text(
                  "5",
                  style: TextStyle(
                      color: isDarkMode ? Colors.white : Colors.redAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 55),
                ),
              ),
              Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("=",
                          style: TextStyle(
                              color: isDarkMode ? Colors.green : Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 24)),
                      Text("3 + 2",
                          style: TextStyle(
                              color: isDarkMode ? Colors.green : Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 24))
                    ],
                  )),
              SizedBox(
                height: 10,
              ),
            ],
          ),
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

  Widget _buttonRounded(
      {String? title,
      double padding = 17,
      IconData? icon,
      Color? iconColor,
      Color? textColor}) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: NeoContainer(
        darkMode: isDarkMode,
        borderRadius: BorderRadius.circular(40),
        padding: EdgeInsets.all(padding),
        child: Container(
          width: padding * 2,
          height: padding * 2,
          child: Center(
              child: title != null
                  ? Text(
                      '$title',
                      style: TextStyle(
                          color: textColor != null
                              ? textColor
                              : isDarkMode
                                  ? Colors.white
                                  : Colors.black,
                          fontSize: 30),
                    )
                  : Icon(
                      icon,
                      color: iconColor,
                      size: 30,
                    )),
        ),
      ),
    );
  }
}
