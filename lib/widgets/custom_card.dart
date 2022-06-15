import 'package:first_store_app/screens/update_product.dart';
import 'package:flutter/material.dart';

import '../models/product_model.dart';

class CustomCard extends StatelessWidget {
   CustomCard({
    // required this.product,
    Key? key,
  }) : super(key: key);

  late ProductModel product;

  @override
  Widget build(BuildContext context) {


    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, UpdateProductPage.id, arguments: product);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 130,
            width: 220,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    blurRadius: 40,
                    color: Colors.grey.withOpacity(0),
                    spreadRadius: 0,
                    offset: Offset(10, 10)),
              ],
            ),
            child: Card(
                elevation: 10,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hand Bag lv',
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            r'$255',
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                          ),
                          Icon(Icons.favorite, color: Colors.red)
                        ],
                      )
                    ],
                  ),
                )),
          ),
          Positioned(

              right: 32,
              bottom: 80,
              child: Image.network(
                 'https://post.healthline.com/wp-content/uploads/2021/05/1144163-987539-The-Top-7-Altra-Running-Shoes-of-2021-732x549-feature.jpg',
                  height: 100,
                width: 100,
              )),
        ],
      ),
    );
  }
}
