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
              Container(
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isDarkMode = !isDarkMode;
                      });
                    },
                    child: _switchMode(),
                  ),
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                alignment: Alignment.centerRight,
                child: Text(
                  "22",
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
                      Text("10*2+2",
                          style: TextStyle(
                              color: isDarkMode ? Colors.green : Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 24))
                    ],
                  )),
              const Spacer(),
              Column(
                children: [
                  _getRowItem(
                      _button(
                          title: "C",
                          textColor:
                              isDarkMode ? Colors.green : Colors.redAccent),
                      _button(
                        title: "(",
                      ),
                      _button(
                        title: ")",
                      ),
                      _button(
                          title: "/",
                          textColor:
                              isDarkMode ? Colors.green : Colors.redAccent)),
                  _getRowItem(
                      _button(
                        title: "7",
                      ),
                      _button(
                        title: "8",
                      ),
                      _button(
                        title: "9",
                      ),
                      _button(
                          title: "X",
                          textColor:
                              isDarkMode ? Colors.green : Colors.redAccent)),
                  _getRowItem(
                      _button(
                        title: "4",
                      ),
                      _button(
                        title: "5",
                      ),
                      _button(
                        title: "6",
                      ),
                      _button(
                          title: "-",
                          textColor:
                              isDarkMode ? Colors.green : Colors.redAccent)),
                  _getRowItem(
                      _button(
                        title: "1",
                      ),
                      _button(
                        title: "2",
                      ),
                      _button(
                        title: "3",
                      ),
                      _button(
                          title: "+",
                          textColor:
                              isDarkMode ? Colors.green : Colors.redAccent)),
                  _getRowItem(
                      _button(
                        title: "0",
                      ),
                      _button(
                        title: ".",
                      ),
                      _button(
                          icon: Icons.backspace_outlined,
                          iconColor:
                              isDarkMode ? Colors.green : Colors.redAccent),
                      _button(
                          title: "=",
                          textColor:
                              isDarkMode ? Colors.green : Colors.redAccent))
                ],
              )
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

  Widget _button(
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

  Widget _getRowItem(Widget w1, Widget w2, Widget w3, Widget w4) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [w1, w2, w3, w4],
    );
  }
}
