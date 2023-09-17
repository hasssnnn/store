// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import '../models/product_model.dart';
import '../screens/update_product_screen.dart';

class CustomCard extends StatelessWidget {
   CustomCard({super.key, required this.productModel,});
   ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).pushNamed(UpdateProductScreen.id, arguments:productModel );
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 120,
            width: 200,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  blurRadius: 40,
                  spreadRadius: 0,
                  offset: const Offset(10, 10),
                  color: Colors.grey.withOpacity(0.2))
            ]),
            child:  Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productModel.title.substring(0,6),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          r'$''${productModel.price}',
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const Icon(FontAwesomeIcons.heart)
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              top: -60,
              right: 32,
              child: Image.network(
                productModel.imageURL,
                height: 100,
                width: 100,
              ))
        ],
      ),
    );
  }
}
