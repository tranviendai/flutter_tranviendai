import 'package:flutter/material.dart';
import 'package:flutter_tranviendai/pages/bottom_navigation.dart';
import 'package:flutter_tranviendai/pages/cart/cart_screen.dart';
import 'package:flutter_tranviendai/pages/product/home.dart';
import 'package:flutter_tranviendai/pages/splash/splash_screen.dart';

class AppRoute {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case 'Home':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case 'page':
        return MaterialPageRoute(builder: (_) => const TabMobile());
      case 'Cart':
        return MaterialPageRoute(builder: (_) => const CartScreen());
    default:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
  }
}
