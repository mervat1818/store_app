import 'package:first_store_app/models/product_model.dart';
import 'package:first_store_app/services/get_all_product_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/custom_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static String id = 'homePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: null,
              icon: Icon(FontAwesomeIcons.cartPlus, color: Colors.black))
        ],
        backgroundColor: Colors.white,
        title: Text(
          'New Trend',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<List<ProductModel>>(
        future: GetAllProductsService().getAllProducts(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            // List<ProductModel> products = snapshot.data!;

            return GridView.builder(
              // itemCount: products.length,
              clipBehavior: Clip.none,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 100,
              ),
              itemBuilder: (context, index) {
                return CustomCard();
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }

        },
      ),
    );
  }
}
