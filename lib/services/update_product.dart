// ignore_for_file: missing_required_param

import '../helper/api_class.dart';
import '../models/product_model.dart';

class UpdateProductService {
  Future<ProductModel> updateProduct(
      {required dynamic id,
      required String title,
      required String image,
      required String description,
      required String price,
      required String category}) async {
    print('product id is = $id');
    Map<String, dynamic> data =
        await API().put(url: "https://fakestoreapi.com/products/$id", body: {
      'title': title.toString(),
      'description': description,
      'price': price,
      'category': category,
      'image': image,
      'id': id
    });
    return ProductModel.fromJson(data);
  }
}
