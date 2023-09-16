// ignore_for_file: missing_required_param

import 'package:untitled/helper/api_class.dart';
import 'package:untitled/models/product_model.dart';

class CategoriesServices {
  Future<List<ProductModel>> getCategoriesProducts(
      {required String categoryName}) async {
    List<dynamic> data = await API().get(url: 'https://fakestoreapi.com/products/category/$categoryName');
    List<ProductModel> categorisProductsList = [];
    for (int i = 0; i < data.length; i++) {
      categorisProductsList.add(ProductModel.fromJson(data[i]));
    }
    return categorisProductsList;
  }
}
