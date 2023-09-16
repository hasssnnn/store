
// ignore_for_file: missing_required_param

import 'package:untitled/helper/api_class.dart';
import 'package:untitled/models/product_model.dart';

class GetAllProducts {

  Future<List<ProductModel>> getProducts() async {
    List <dynamic> data = await API().get(url: 'https://fakestoreapi.com/products?');
    // http.Response response =
    //     await http.get(Uri.parse('https://fakestoreapi.com/products?'));
    // if (response.statusCode == 200) {
    //   List<dynamic> data = jsonDecode(response.body);
      List<ProductModel> productsList = [];
      for (int i = 0; i < data.length; i++) {
        productsList.add(ProductModel.fromJson(data[i]));
      }
      return productsList;
    }
  }
