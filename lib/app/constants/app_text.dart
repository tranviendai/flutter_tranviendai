// ignore_for_file: prefer_const_declarations, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_tranviendai/app/constants/app_constant.dart';

class AppText {
  static final String welcomeHeader = "JZeno";
  static final String started = "GET STARTED";
  static final String homeText = "Home";
  
  static final String cartText = "Cart";
  static final String addtoCartText = "Add To Cart".toUpperCase();


  static final String fontFamily = "rubik";
  static final String fontFamilyBold = "rubikB";
    static final TextStyle h0 = TextStyle(fontFamily: fontFamilyBold , color: AppColor.blackColor, fontSize: 25, fontWeight: FontWeight.bold);
  static final TextStyle h1 = TextStyle(fontFamily: fontFamilyBold , color: AppColor.blackColor, fontSize: 20, fontWeight: FontWeight.bold);
  static final TextStyle h2 = TextStyle(fontFamily: fontFamily,fontSize: 18);
  static final TextStyle h3 = TextStyle(fontFamily: fontFamily,fontSize: 16,letterSpacing: 1, color: AppColor.greyColor);
  static final TextStyle h4 = TextStyle(fontFamily: fontFamily,fontSize: 16,fontWeight: FontWeight.bold);


  static Widget textButton(String text, Color color){
    return Container(
      margin: const EdgeInsets.all(3),
      padding:const  EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: color
      ),
      child: Text(text,style: TextStyle(color: Colors.white, fontSize: 14),),
    );
  }
}
