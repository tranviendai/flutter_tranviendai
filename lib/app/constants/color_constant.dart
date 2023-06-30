import 'package:flutter/material.dart';

class AppColor {
  static final Color whiteColor = Color.fromARGB(255, 255, 255, 255);
  static final Color blackColor = Color.fromARGB(255, 48, 56, 65);
  static final Color greyColor = Color.fromARGB(255, 119, 119, 119);
  static final Color yellowColor = Color.fromARGB(255, 246, 200, 14);

  Color color(String name){
    return Color(int.parse(name.substring(1,7),radix: 16) + 0xFF000000);
  }
}
