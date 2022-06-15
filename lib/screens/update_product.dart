import 'package:first_store_app/models/product_model.dart';
import 'package:first_store_app/widgets/custome_button.dart';
import 'package:flutter/material.dart';

import '../services/update_product.dart';
import '../widgets/custome_text_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UpdateProductPage extends StatefulWidget {
  UpdateProductPage({Key? key}) : super(key: key);

  static String id = 'update product';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, image, description;
  int? price;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    var product = ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Update Product Page',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextField(
                  hintText: 'Product Name',
                  onChanged: (data) {
                    productName = data;
                  },
                ),
                SizedBox(height: 10),
                CustomTextField(
                    onChanged: (data) {
                      image = data;
                    },
                    hintText: 'Image'),
                SizedBox(height: 10),
                CustomTextField(
                    onChanged: (data) {
                      description = data;
                    },
                    hintText: 'Description'),
                SizedBox(height: 10),
                CustomTextField(
                    onChanged: (data) {
                      price = data as int?;
                    },
                    hintText: 'Price'),
                SizedBox(height: 10),
                CustomButon(
                  text: 'Update',
                  onTap: () async {
                    isLoading = true;
                    setState(() {});
                    try  {
                      await updateProduct(product);
                      print('Success');
                    } catch (e) {
                      print(e.toString());

                      // TODO
                    }
                    isLoading = false;
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    await UpdateProductService().updateProduct(
        title: productName == null ? product.title : productName!,
        image: image == null ? product.image : image!,
        category: product.category,
        description: description == null ? product.description : description!,
        price: price == null ? product.price : price!);
  }
}
