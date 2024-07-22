import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ReUsableButton extends StatelessWidget {
  final VoidCallback onTap;
  final String buttonText;
  final double width;

  const ReUsableButton({
    super.key,
    required this.onTap,
    required this.buttonText,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: Get.height * .077,
        decoration: BoxDecoration(
          color: const Color(0xff246BFD),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: GoogleFonts.sourceSans3(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
