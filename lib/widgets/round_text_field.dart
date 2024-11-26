import 'package:flutter/material.dart';

class RoundTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final IconData icon;
  final bool obsecure;
  const RoundTextField(
      {super.key,
      required this.hintText,
      required this.controller,
      required this.icon,
      required this.obsecure});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color.fromARGB(255, 243, 236, 236),
      ),
      child: TextField(
        controller: controller,
        obscureText: obsecure,
        readOnly: true,
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
            prefixIcon: Icon(
              icon as IconData?,
              size: 22,
              color: Colors.grey,
            ),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none),
      ),
    );
  }
}
