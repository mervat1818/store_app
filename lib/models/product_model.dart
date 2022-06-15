class ProductModel {
  final int id;
  final String title;
  final int price;
  final String description;
  final String category;
  final String image;
  final RatingModel rating;

  ProductModel(
      {required this.rating,
      required this.id,
      required this.category,
      required this.description,
      required this.image,
      required this.price,
      required this.title});

  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
        id: jsonData["id"],
        category: jsonData["category"],
        description: jsonData["description"],
        image: jsonData["image"],
        price: jsonData["price"],
        title: jsonData["title"],
        rating: RatingModel.fromJson(jsonData["rating"]));
  }
}

class RatingModel {
  final double rate;
  final int count;

  RatingModel({required this.count, required this.rate});

  factory RatingModel.fromJson(jsonData) {
    return RatingModel(count: jsonData['count'], rate: jsonData['rate']);
  }
}
