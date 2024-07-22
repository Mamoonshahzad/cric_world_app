import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReUsableTextField extends StatelessWidget {
  final TextEditingController fieldController;
  final String text;
  final IconData icon;
  final IconData? suffixIcon;

  const ReUsableTextField({
    super.key,
    required this.text,
    required this.icon,
    this.suffixIcon,
    required this.fieldController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * .077,
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: TextFormField(
          controller: fieldController,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: text,
            hintStyle: const TextStyle(color: Colors.white),
            prefixIcon: Icon(icon, color: Colors.white),
            suffixIcon: suffixIcon != null
                ? Icon(suffixIcon, color: Colors.white)
                : null,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
