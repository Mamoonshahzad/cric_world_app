import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String appbarTitle;
  const CustomAppBar({super.key, required this.appbarTitle});

  @override
  Size get preferredSize => Size.fromHeight(Get.height*.1);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.orange,
      centerTitle: true,
      title: Text(appbarTitle, style: GoogleFonts.sourceSans3(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)),
    );
  }
}
