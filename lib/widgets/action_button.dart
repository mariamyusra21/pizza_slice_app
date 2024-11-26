import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final String text;
  final bool isPlain;
  const ActionButton({
    super.key,
    required this.text,
    required this.isPlain,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 56.53,
      decoration: ShapeDecoration(
        color: isPlain ? Color(0XFFfcf4f2) : const Color(0xFFDB1818),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 30,
            offset: Offset(0, 9),
            spreadRadius: 0,
          )
        ],
      ),
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isPlain ? Colors.grey : Colors.white,
            fontSize: 18,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
            // height: 0.08,
          ),
        ),
      ),
    );
  }
}
