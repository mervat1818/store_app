import 'package:first_store_app/screens/home_page.dart';
import 'package:first_store_app/screens/update_product.dart';
import 'package:first_store_app/services/update_product.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FirstStore());
}

class FirstStore extends StatelessWidget {
  const FirstStore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomePage.id,
      routes: {
        HomePage.id: (context) => HomePage(),
        UpdateProductPage.id: (context) => UpdateProductPage(),
      },
    );
  }
}
