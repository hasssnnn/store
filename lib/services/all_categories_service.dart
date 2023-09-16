// ignore_for_file: missing_required_param

import 'package:untitled/helper/api_class.dart';

class AllCategoriesService {
  Future<List<dynamic>> getAllCategories() async {
    List<dynamic> data =
        await API().get(url: 'https://fakestoreapi.com/products/categories');
    return data;
  }
}
