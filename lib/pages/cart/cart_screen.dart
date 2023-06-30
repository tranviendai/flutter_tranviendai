import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tranviendai/app/constants/app_constant.dart';
import 'package:flutter_tranviendai/app/constants/app_text.dart';
import 'package:flutter_tranviendai/app/model/product_model.dart';
import 'package:flutter_tranviendai/pages/cart/cubit/cart_cubit.dart';
import 'package:flutter_tranviendai/pages/product/cubit/product_cubit.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    context.read<CartCubit>().fetchShoes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, List<Shoe>>(builder: (context, state) {
      if (state.isEmpty) {
        return Container(
          margin: const EdgeInsets.only(left: 20),
          child: Text(
            "Your cart is empty.",
            style: AppText.h3,
          ),
        );
      }
      return Container(
        margin: const EdgeInsets.only(left: 40, right: 40, bottom: 40),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: state.length,
          itemBuilder: (context, index) {
            var product = state[index];
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                    flex: 1,
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 16,
                          right: -5,
                          child: Container(
                            height: 80,
                            padding: const EdgeInsets.all(50),
                            decoration: BoxDecoration(
                                color: AppColor().color(product.color!),
                                shape: BoxShape.circle),
                          ),
                        ),
                        Transform.rotate(
                            angle: 5.7,
                            child: Container(
                              height: 140,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(product.image!)),
                              ),
                            )),
                      ],
                    )),
                Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(product.name!, style: AppText.h4),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "\$${product.price}",
                            style: AppText.h1,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 200, 200, 200),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          product.quantity--;
                                        });
                                        if (product.quantity == 0) {
                                          context
                                              .read<CartCubit>()
                                              .removeShoe(product);
                                          context
                                              .read<ProductCubit>()
                                              .fetchProducts();
                                        }
                                      },
                                      child: Image.asset(AppImage.minus,
                                          height: 12),
                                    ),
                                  ),
                                  Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Text(product.quantity.toString())),
                                  Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 200, 200, 200),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          product.quantity++;
                                        });
                                      },
                                      child: Image.asset(AppImage.plus,
                                          height: 12),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: AppColor.yellowColor,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      product.filled = false;
                                      product.quantity = 0;
                                      context
                                          .read<ProductCubit>()
                                          .fetchProducts();
                                    });
                                    context
                                        .read<CartCubit>()
                                        .removeShoe(product);
                                  },
                                  child: Image.asset(
                                    AppImage.trash,
                                    height: 16,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ))
              ],
            );
          },
        ),
      );
    });
  }
}
