// ignore_for_file: missing_required_param


import '../helper/api_class.dart';
import '../models/product_model.dart';

class AddProduct {
  Future<ProductModel> addProduct(
      {required String title,
      required String image,
      required String description,
      required String price,
      required String category}) async {
    Map<String, dynamic> data =
        await API().post(url: "https://fakestoreapi.com/products", body: {
      'title': title,
      'description': description,
      'price': price,
      'category': category,
      'image': image
    });
    return ProductModel.fromJson(data);
  }
}
