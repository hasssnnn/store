class ProductModel {
  final dynamic id;
  final String title;
  final dynamic price;
  final String description;
  final String imageURL;
  //final ProductRatingModel rating;
  final String category;

  ProductModel(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.imageURL,
      required this.category});
      //       required this.rating, 


  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
        id: jsonData['id'],
        title: jsonData['title'],
        price: jsonData['price'],
        description: jsonData['description'],
        imageURL: jsonData['image'],
        category: jsonData['category']
    );
  }
         // rating: ProductRatingModel.fromJson(jsonData['rating']==null?null:ProductRatingModel.fromJson(jsonData['rating'])));

}

// class ProductRatingModel {
//   final dynamic rate;
//   final int count;

//   ProductRatingModel({required this.rate, required this.count});
//   factory ProductRatingModel.fromJson(jsonData) {
//     return ProductRatingModel(rate: jsonData['rate'], count: jsonData['count']);
//   }
// }
// rate: jsonData['rate'] == null? 0.0 : jsonData['rate'].toDouble()
// jsonData['price'] == null ? 0.0 : jsonData['price'].toDouble()
