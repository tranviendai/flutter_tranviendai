
import 'package:flutter_tranviendai/app/model/product_model.dart';

abstract class ProductState{}

class ProductLoadingState extends ProductState{}

class ProductLoadedState extends ProductState{
  final ProductModel product;
  ProductLoadedState(this.product);
}
class ProductErrorState extends ProductState{
  final String error;
  ProductErrorState(this.error);
}
