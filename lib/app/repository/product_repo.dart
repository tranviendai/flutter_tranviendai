import 'package:dio/dio.dart';
import 'package:flutter_tranviendai/app/model/product_model.dart';
import 'package:flutter_tranviendai/app/repository/API/api.dart';

class APIRepository {
  API api = API();

  Future<ProductModel> fetchProduct() async {
    try {
      Response res = await api.sendRequest.get('/shoes.json');
      var data = res.data;
      return productModelFromJson(data);
    } catch (ex) {
      rethrow;
    }
  }
}
