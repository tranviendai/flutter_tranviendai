import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tranviendai/app/constants/app_constant.dart';
import 'package:flutter_tranviendai/app/constants/app_text.dart';
import 'package:flutter_tranviendai/pages/cart/cart_screen.dart';
import 'package:flutter_tranviendai/pages/cart/cubit/cart_cubit.dart';
import 'package:flutter_tranviendai/pages/product/home.dart';

class TabMobile extends StatefulWidget {
  const TabMobile({super.key});

  @override
  State<TabMobile> createState() => _TabMobileState();
}

class _TabMobileState extends State<TabMobile> {
  final PageController pageController = PageController();
  int _selectedIndex = 0;
  String total = "0.0";
  final List<Widget> widgetOptions = const [HomeScreen(), CartScreen()];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    pageController.jumpToPage(index);
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          flexibleSpace: Container(
            color: Colors.transparent,
            margin: const EdgeInsets.only(left: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5),
                Image.asset(
                  AppImage.nike,
                  height: 35,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _selectedIndex == 0
                    ? Text("Our Products", style: AppText.h0)
                    : Text("Your cart", style: AppText.h0),
                    _selectedIndex == 0?
                    Container() :
                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      child: Text("\$${context.read<CartCubit>().subTotal.toStringAsFixed(2)}" ,style: AppText.h0,),
                    )
                  ],
                )
              ],
            ),
          ),
          
        ),
        extendBodyBehindAppBar: true,
        extendBody: true,
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: "Cart")
          ],
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
        ),
        body: WillPopScope(
          onWillPop: () async => false,
          child: PageView.builder(
            controller: pageController,
            itemCount: widgetOptions.length,
            allowImplicitScrolling: true,
            onPageChanged: (value) {
              _onItemTapped(value);
            },
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Positioned(
                      top: -360,
                      left: -380,
                      child: Transform.rotate(
                        angle: 6.2,
                        child: Container(
                          width: 500,
                          height: 520,
                          decoration: BoxDecoration(
                              color: AppColor.yellowColor,
                              borderRadius: BorderRadius.circular(100)),
                        ),
                      )),
                  Container(
                    margin: const EdgeInsets.only(top: 100),
                    child: widgetOptions.elementAt(index)
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
