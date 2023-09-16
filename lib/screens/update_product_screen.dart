// ignore_for_file: must_be_immutable, unused_local_variable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:untitled/helper/snack_bar.dart';
import 'package:untitled/models/product_model.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../services/update_product.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class UpdateProductScreen extends StatefulWidget {
  const UpdateProductScreen({
    super.key,
  });
  static String id = 'UpdateProductScreen';

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  String? productName, description, image, price;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel productModel =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Update Product',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 100),
                CustomTextField(
                  onChanged: (data) {
                    productName = data;
                  },
                  labelText: 'Name',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  textInputType: TextInputType.number,
                  onChanged: (data) {
                    price = data;
                  },
                  labelText: 'Price',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  labelText: 'Description',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  labelText: 'Image',
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButon(
                  text: 'Update',
                  onTap: () async {
                    isLoading = true;
                    setState(() {});

                    try {
                      await updateProduct(productModel);
                      showSnackBar(context, 'Item is Updated Successfully.');
                    } catch (e) {
                      showSnackBar(
                          context, 'There is an error ${e.toString()}');
                    }
                    isLoading = false;
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel productModel) async {
    await UpdateProductService().updateProduct(
        id: productModel.id,
        title: productName == null ? productModel.title.toString() : productName!.toString(),
        image: image == null ? productModel.imageURL : image!,
        description:
            description == null ? productModel.description : description!,
        price:
            price == null ? productModel.price.toString() : price!.toString(),
        category: productModel.category);
  }
}
