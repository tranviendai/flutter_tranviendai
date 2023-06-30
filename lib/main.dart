import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tranviendai/app/routes/AppRoute.dart';
import 'package:flutter_tranviendai/pages/product/cubit/product_cubit.dart';
import 'package:flutter_tranviendai/pages/cart/cubit/cart_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => ProductCubit()),
      BlocProvider(create: (context) => CartCubit()),
    ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        initialRoute: "/",
        onGenerateRoute: AppRoute.onGenerateRoute,
      ),
    );
  }
}
