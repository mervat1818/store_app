import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:first_store_app/models/product_model.dart';

import '../helper/api.dart';

class CategoriesService {
  Future<List<ProductModel>> getCategoriesProductsService(
      {required String categoryName}) async {
    http.Response response = await Api()
        .get(url: 'https://fakestoreapi.com/products/category/${categoryName}');

    dynamic data = jsonDecode(response.body);

    List<ProductModel> productsList = [];
    for (int i = 0; i < data.length; i++) {
      productsList.add(
        ProductModel.fromJson(data[i]),
      );
    }
    return productsList;
  }
}
