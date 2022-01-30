import 'package:flutter/material.dart';

const Color colorDark = Color(0xFF374352);
const Color colorLight = Color(0xFFe6eeff);

class NeoContainer extends StatefulWidget {
  final bool darkMode;
  final Widget child;
  final BorderRadius borderRadius;
  final EdgeInsetsGeometry padding;

  const NeoContainer(
      {required this.borderRadius,
      required this.child,
      required this.darkMode,
      required this.padding});

  @override
  _NeoContainerState createState() => _NeoContainerState();
}

class _NeoContainerState extends State<NeoContainer> {
  bool _isPressed = false;

  void _onPointerUp(PointerUpEvent event) {
    print(event);
    setState(() {
      _isPressed = false;
    });
  }

  void _onPointerDown(PointerDownEvent event) {
    print(event);
    setState(() {
      _isPressed = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool darkMode = widget.darkMode;
    return Listener(
      onPointerDown: _onPointerDown,
      onPointerUp: _onPointerUp,
      child: Container(
        padding: widget.padding,
        decoration: BoxDecoration(
            color: darkMode ? colorDark : colorLight,
            borderRadius: widget.borderRadius,
            boxShadow: _isPressed
                ? null
                : [
                    BoxShadow(
                      color:
                          darkMode ? Colors.black54 : Colors.blueGrey.shade200,
                      offset: Offset(4, 4),
                      blurRadius: 14.0,
                      spreadRadius: 1.0,
                    ),
                    BoxShadow(
                        color:
                            darkMode ? Colors.blueGrey.shade700 : Colors.white,
                        offset: Offset(-4, -4),
                        blurRadius: 14,
                        spreadRadius: 1.0)
                  ]),
        child: widget.child,
      ),
    );
  }
}
