import 'dart:convert';
import 'package:first_store_app/helper/api.dart';
import 'package:first_store_app/models/product_model.dart';
import 'package:http/http.dart' as http;

class GetAllProductsService {
  Future<List<ProductModel>> getAllProducts() async {
    http.Response response =
        await Api().get(url: 'https://fakestoreapi.com/products');

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
