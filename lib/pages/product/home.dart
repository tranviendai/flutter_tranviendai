import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tranviendai/app/constants/app_constant.dart';
import 'package:flutter_tranviendai/app/constants/app_text.dart';
import 'package:flutter_tranviendai/app/constants/color_constant.dart';
import 'package:flutter_tranviendai/pages/product/cubit/product_cubit.dart';
import 'package:flutter_tranviendai/pages/product/cubit/product_state.dart';
import 'package:flutter_tranviendai/pages/cart/cubit/cart_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    refresh();
    super.initState();
  }

  Future refresh() async {
    Timer(const Duration(seconds: 1), () {
      context.read<ProductCubit>().fetchProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is ProductLoadedState) {
          return Container(
              margin: const EdgeInsets.only(left: 40, right: 40, bottom: 40),
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                itemCount: state.product.shoes!.length,
                itemBuilder: (context, index) {
                  var product = state.product.shoes![index];
                  return Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                          right: 40,
                          bottom: 50,
                        ),
                        decoration: BoxDecoration(
                            color: AppColor().color(product.color.toString()),
                            borderRadius: BorderRadius.circular(50)),
                        child: Transform.rotate(
                          angle: 5.8,
                          child: Container(
                            height: 350,
                            width: 350,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(product.image!)),
                                borderRadius: BorderRadius.circular(100),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(20, 50),
                                    blurRadius: 100,
                                  )
                                ]),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          product.name.toString(),
                          style: AppText.h1,
                        ),
                      ),
                      Text(
                        product.description.toString(),
                        style: AppText.h3,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "\$${product.price}",
                              style: AppText.h1,
                            ),
                             product.filled! == true ? Container(
                                  height: 45,
                                  width: 45,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: AppColor.yellowColor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(AppImage.check),
                                ) : ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(AppColor.yellowColor),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(100)))),
                                                 onPressed: () {
                                  setState(() {
                                    product.filled = true;
                                    product.quantity = 1;
                                  });
                                  context.read<CartCubit>().addShoe(product);
                                },
                                child: Text(AppText.addtoCartText,
                                    style: AppText.h1),
                               ),
                          ],
                        ),
                      )
                    ],
                  );
                },
              ));
        }
        return Center(
            child: TextButton(
          child: const Text("Restart Application Pls!"),
          onPressed: () => refresh(),
        ));
      },
    );
  }
}
