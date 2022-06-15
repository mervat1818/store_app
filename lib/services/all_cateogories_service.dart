import 'dart:convert';

import 'package:http/http.dart' as http;

import '../helper/api.dart';

class AllCategoriesService {
  Future<List<dynamic>> getAllCategories() async {
    http.Response response =
        await Api().get(url: 'https://fakestoreapi.com/products/categories');

    dynamic data = jsonDecode(response.body);
    return data;
  }
}
