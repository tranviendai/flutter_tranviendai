import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tranviendai/app/model/product_model.dart';
import 'package:flutter_tranviendai/app/repository/product_repo.dart';
import 'package:flutter_tranviendai/pages/product/cubit/product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductLoadingState());

  APIRepository productRepo = APIRepository();

  void fetchProducts() async {
    try {
      ProductModel product = await productRepo.fetchProduct();
      emit(ProductLoadedState(product));
    } catch (ex) {
      emit(ProductErrorState(ex.toString()));
    }
  }
}