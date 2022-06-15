import 'package:first_store_app/helper/api.dart';
import 'package:first_store_app/models/product_model.dart';

class UpdateProductService {
  Future<ProductModel> updateProduct({required String title, required String image,
      required String category, required String description, required int price}) async {
    Map<String, dynamic> data = await Api().post(
      url: 'https://fakestoreapi.com/products',
      body: {
        'title': title,
        'price': price,
        'description': description,
        'image': image,
        'category': category
      },
    );

    return ProductModel.fromJson(data);
  }
}
